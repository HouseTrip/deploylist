class DeploysController < ApplicationController
  def index
    @deploys = Deploy.production
  end
end
