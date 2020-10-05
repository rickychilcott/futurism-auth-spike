class HomeController < ApplicationController
  MAX_RESOURCES = 100

  def index
    # Generate 100 resources on first load
    MAX_RESOURCES.times { Resource.create! } unless Resource.count >= MAX_RESOURCES
  end
end
