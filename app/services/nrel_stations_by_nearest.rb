class NrelStationsByNearest

  def initialize(zipcode, distance = 6)
    @zipcode = zipcode
    @distance = distance
  end

  def stations
    NrelServiceStationsSearch.new(zipcode, distance).run[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :zipcode, :distance

end
