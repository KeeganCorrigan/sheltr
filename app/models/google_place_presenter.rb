class GooglePlacePresenter
  def initialize(type, location)
    @type = type
    @location = location
    @google_place_service = GooglePlaceService.new
  end

  def locations
    unsorted_locations.sort_by { |place| place.open_now }.reverse
  end

  private

  def unsorted_locations
    @google_place_service.locations(@type, @location).map do |place|
      Location.new(place)
    end.compact
  end
end
