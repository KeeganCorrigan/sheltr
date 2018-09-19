class GooglePlacePresenter
  attr_reader :current_search

  def initialize(type, location)
    @type = type
    @location = location
    @google_place_service = GooglePlaceService.new
    @current_search = location
  end

  def locations
    unsorted_locations.sort_by { |place| place.open_now }.reverse
  end

  def first_open_location
    return "No open locations nearby. Make sure you input the city or zip code correctly." if locations.length == 0

    locations.find do |location|
      if location.open_now == "true"
        return "#{location.name} is open.
          Address: #{location.formatted_address}
          Number: #{location.formatted_phone_number}
          For more information, visit #{location.website}."
      else
        return "No open locations nearby. Make sure you input the city or zip code correctly."
      end
    end
  end

  private

  def unsorted_locations
    @google_place_service.locations(@type, @location).map do |place|
      Location.new(place)
    end.compact
  end
end
