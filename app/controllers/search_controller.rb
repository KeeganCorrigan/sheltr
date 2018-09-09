class SearchController < ApplicationController
  def index
    locations = GooglePlaceService.new.locations(params[:subaction], params[:q])


    @locations = locations.map do |place|
      Location.new(place)
    end.compact
  end
end
