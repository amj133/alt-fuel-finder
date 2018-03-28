class NrelServiceStationsSearch

  def initialize(zipcode, distance)
    @zipcode = zipcode
    @distance = distance
  end

  def run
    get_json("/api/alt-fuel-stations/v1/nearest.json")
  end

  private
    attr_reader :zipcode, :distance

    def conn
      Faraday.new(url: "https://developer.nrel.gov/")
    end

    def params
      {
        "fuel_type" => "ELEC,LPG",
        "api_key" => ENV['NREL-API-KEY'],
        "location" => zipcode,
        "limit" => 10,
        "radius" => distance
      }
    end

    def get_json(url)
      response = conn.get(url, params)
      JSON.parse(response.body, symbolize_names: true)
    end
end
