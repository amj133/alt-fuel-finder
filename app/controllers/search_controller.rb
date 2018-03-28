class SearchController < ApplicationController

  def index
    binding.pry
    params = {
      "fuel_type" => "ELEC,LPG",
      "api_key" => ENV['NREL-API-KEY'],
      "location" => 80203,
      "limit" => 10,
      "radius" => 6
    }
    conn = Faraday.new(url: "https://developer.nrel.gov/")
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json")

  end

end

# https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
