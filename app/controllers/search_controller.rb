class SearchController < ApplicationController
  def index
    if params[:q]
      session[:zip] = params[:q]
    end

    locations = GooglePlaceService.new.locations(params[:subaction], session[:zip])

    @locations = locations.map do |place|
      Location.new(place)
    end.compact
  end
end
