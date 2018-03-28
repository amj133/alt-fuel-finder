class SearchController < ApplicationController

  def index
    params = {
      "fuel_type" => "ELEC,LPG",
      "api_key" => ENV['NREL-API-KEY'],
      "location" => 80203,
      "limit" => 10,
      "radius" => 6
    }
    conn = Faraday.new(url: "https://developer.nrel.gov/")
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json", params)
    response = JSON.parse(response.body, symbolize_names: true)
    @stations = response[:fuel_stations].map do |station|
      Station.new(station)
    end
    # @stations = NrelStationsByNearest.new(80203).stations
    # hard-coded zip - couldn't access params
  end

end

# https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
