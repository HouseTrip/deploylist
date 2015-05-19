class DeploysController < ApplicationController
  include ActionController::Live

  protect_from_forgery with: :exception, except: [ :deploy ]

  def index
    @deploys = Deploy.production.limit(50)
  end

  def all
    @deploys = Deploy.production
    render :index
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

  def denied
    render text: "No access", status: 403
  end

  private

  def seconds_taken_to(&blk)
    before = Time.now
    yield
    after = Time.now
    (after - before).to_i
  end
end
