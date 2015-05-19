require 'faraday'
require 'faraday_middleware'

class DeployFetcher
  def initialize(logger)
    @logger = logger
    @page, @num_pages = 1, nil
  end

  def call
    @logger.log("Fetching Honeybadger info", newline: false)
    begin
      DeployImporter.import(fetch_next_page)
    end while @page <= @num_pages
    @logger.log(".")
  end

  private

  def fetch_next_page
    @logger.log(".", newline: false)
    response = client.get(remote_path(page: @page))
    @logger.log(".", newline: false)
    @page += 1
    @num_pages ||= response.body["num_pages"]

    response.body["results"]
  end

  def remote_path(page: 1, environment: 'production')
    "v1/projects/#{ENV['HONEYBADGER_PROJECT_ID']}/deploys?environment=#{environment}&page=#{page}&auth_token=#{ENV['HONEYBADGER_TOKEN']}&created_after=#{created_after}"
  end

  def created_after
    # time when the deploy script was fixed to send the right sha to honeybadger
    DateTime.parse(ENV.fetch('DEPLOYS_FROM', '2015-02-20')).to_i
  end


  def client
    @client ||= Faraday.new(url: 'https://api.honeybadger.io') do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
    end
  end
end
