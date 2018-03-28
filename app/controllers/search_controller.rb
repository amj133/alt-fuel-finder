class SearchController < ApplicationController

  def index
    @stations = NrelStationsByNearest.new(80203).stations
    # hard-coded zip - couldn't access params
  end

end

# https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
