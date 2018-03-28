require 'rails_helper'

describe Station do
  let(:attrs) {
    station_name: "Bobs",
    street_address: "123 Fake St.",
    fuel_types: "Vegetable oil",
    distance: 0.75,
    access_times: "24 hrs!"
  }
  subject { Station.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Station)
  end

  it "sets attributes as reader methods" do
    expect(subject.name).to eq("Bobs")
    expect(subject.street_address).to eq("123 Fake St.")
    expect(subject.fuel_types).to eq("Vegetable oil")
    expect(subject.distance).to eq(0.75)
    expect(subject.access_times).to eq("24 hrs!")
  end
end
