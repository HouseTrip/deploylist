class DeploysController < ApplicationController
  include ActionController::Live

  def index
    @deploys = Deploy.production.map { |d| DeployPresenter.new(d) }
  end

  def ping
    render text: 'pong'
  end

  def fetch
    response.stream.write("Kicking off the import...")
    response.stream.write("import complete. (took #{seconds_taken_to { FullImport.call(1) }} seconds)")
    response.stream.close
  end

  private

  def seconds_taken_to(&blk)
    before = Time.now
    yield
    after = Time.now
    (after - before).to_i
  end
end
