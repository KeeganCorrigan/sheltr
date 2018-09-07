class SearchController < ApplicationController
  def index
    conn = Faraday.get "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{params[:subaction]}+in+#{params[:q]}&key=#{ENV["GOOGLE_API_KEY"]}"

    payload = JSON.parse(conn.body, symbolize_names: true)


    payload[:results].each do |place|
      conn_2 = Faraday.get "https://maps.googleapis.com/maps/api/place/details/json?key=#{ENV["GOOGLE_API_KEY"]}&place_id=#{place[:id]}&fields=formatted_address,formatted_phone_number,website"

      payload_2 = JSON.parse(conn_2.body, symbolize_names: true)
    end
  end
end
