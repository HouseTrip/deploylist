class DeploysController < ApplicationController
  include ActionController::Live

  before_action :authenticate, except: [:ping, :deploy], if: -> { Rails.env.production? }

  def index
    @deploys = Deploy.production.map { |d| DeployPresenter.new(d) }
  end

  def ping
    render text: 'pong'
  end

  def deploy
    begin
      response.headers['Content-Type'] = 'text/event-stream'
      response.stream.write("Import completed in #{seconds_taken_to { FullImport.call(limit: 1, stream: response.stream) }} seconds.")
    ensure
      response.stream.close
    end
  end

  private

  def seconds_taken_to(&blk)
    before = Time.now
    yield
    after = Time.now
    (after - before).to_i
  end
end
