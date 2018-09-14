class SearchController < ApplicationController
  def index
    set_session_zip(params[:q])
    @presenter = GooglePlacePresenter.new(params[:subaction], session[:zip])
  end

  private

  def set_session_zip(location)
    if location
      session[:zip] = location
    end
  end
end
