require 'rails_helper'

describe NrelServiceStationsSearch do
  it "returns collection of raw stations" do
    json = NrelServiceStationsSearch.new(80203, 6).run
    raw_stations = json[:fuel_stations]

    expect(raw_stations.count).to eq(10)
    expect(raw_stations.first[:station_name]).to be_a(String)
    expect(raw_stations.first[:access_days_time]).to be_a(String)
  end
end
