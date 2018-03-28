class SearchController < ApplicationController

  def index
    @stations = NrelStationsByNearest.new(params["q"].to_i).stations
  end

end

# https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
