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
    response = client.get("v1/projects/36361/deploys?page=#{@page}&auth_token=#{ENV['HONEYBADGER_TOKEN']}")
    @logger.log(".", newline: false)
    @page += 1
    @num_pages ||= response.body["num_pages"]

    response.body["results"]
  end

  def client
    @client ||= Faraday.new(url: 'https://api.honeybadger.io') do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
    end
  end
end
