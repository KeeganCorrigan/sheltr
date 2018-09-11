class SearchController < ApplicationController
  def index
    set_session_zip(params[:q])
    @presenter = GooglePlacePresenter.new(search_params[:subaction], session[:zip])
  end

  private

  def set_session_zip(location)
    if location
      session[:zip] = location
    end
  end

  def search_params
    params.permit(:subaction, :q)
  end
end
