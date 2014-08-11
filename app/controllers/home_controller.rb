class HomeController < ApplicationController
  def index
    @deploys = Deploy.production
  end
end
