require 'rails_helper'

describe NrelStationsByNearest do
  it "returns collection of stations" do
    stations = NrelStationsByNearest.new(80203).stations

    expect(stations.count).to eq(10)
    expect(stations.first).to be_a(Station)
    expect(stations.last).to be_a(Station)
  end
end
