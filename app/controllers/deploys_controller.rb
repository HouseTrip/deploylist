class DeploysController < ApplicationController
  include ActionController::Live

  protect_from_forgery with: :exception, except: [ :deploy ]

  def index
    @deploy_search = DeploySearch.new(search_params)
    @deploys = Deploy.production.limit(50)
    if @deploy_search.valid?
      @deploys = @deploys.filter_by_date_range(
                  @deploy_search.lower_bound_date,
                  @deploy_search.upper_bound_date
      )
    end
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

  def search_params
    params.permit(:lower_bound_date, :upper_bound_date)
  end
end
