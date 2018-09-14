class GooglePlaceService
  def initialize
    @conn = Faraday.new(url: "https://maps.googleapis.com")
  end

  def raw_locations(type, location)
    get_url("/maps/api/place/textsearch/json?query=#{type}+in+#{location}&key=#{ENV["GOOGLE_API_KEY"]}")
  end

  def locations(type, location)
    raw_locations(type, location)[:results].map do |place|
      payload = get_url("/maps/api/place/details/json?key=#{ENV["GOOGLE_API_KEY"]}&place_id=#{place[:place_id]}&fields=formatted_address,formatted_phone_number,website,name,opening_hours/weekday_text")

      payload[:open_now] = place[:opening_hours][:open_now] if place[:opening_hours]
      payload[:location] = [place[:geometry][:location][:lat], place[:geometry][:location][:lng]]
      payload
    end
  end

  private

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end
