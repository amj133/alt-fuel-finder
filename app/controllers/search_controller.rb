class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1") do |faraday|
      faraday.headers["NREL-API-KEY"] = ENV['NREL-API-KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

end

# https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
