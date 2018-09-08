class GooglePlaceService
  def initialize
    @conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
              faraday.headers["key"] = "#{ENV["GOOGLE_API_KEY"]}"
              faraday.adapter Faraday.default_adapter
            end
  end

  def raw_locations(type, location)
    get_url("/maps/api/place/textsearch/json?query=#{type}+in+#{location}")
  end

  def locations
    rawlocations[:results].map do |place|
      place_data = get_url("/maps/api/place/details/json?key=#{ENV["GOOGLE_API_KEY"]}&place_id=#{place[:place_id]}&fields=formatted_address,formatted_phone_number,website,name,opening_hours/weekday_text")

      JSON.parse(place_data.body, symbolize_names: true)
    end
  end

  private

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
