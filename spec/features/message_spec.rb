require "rails_helper"

describe "a visitor" do
  describe "texts denver to 7207353029" do
    it "receives a text with the information for the first currently open shelter" do
      VCR.use_cassette("google_place_service_homeless_shelter_locations") do
        to_number = "7207353029"
        from_number = "3039568351"
        


      end
    end
  end
end
