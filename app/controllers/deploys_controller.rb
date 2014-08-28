class DeploysController < ApplicationController
  def index
    @deploys = Deploy.production.map { |d| DeployPresenter.new(d) }
  end

  def ping
    render text: 'pong'
  end
end
