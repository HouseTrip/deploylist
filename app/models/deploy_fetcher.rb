require 'faraday'
require 'faraday_middleware'

class DeployFetcher
  def initialize
    @page, @num_pages = 1, nil
  end

  def fetch
    begin
      DeployImporter.import(fetch_next_page)
      end while @page <= @num_pages
  end

  private

  def fetch_next_page
    response = client.get("v1/projects/36361/deploys?page=#{@page}&auth_token=#{ENV['HONEYBADGER_TOKEN']}")
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
