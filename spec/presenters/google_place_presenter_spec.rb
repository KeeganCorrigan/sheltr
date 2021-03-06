require "rails_helper"

describe GooglePlacePresenter do
  context "instance methods" do
    describe "#locations" do
      it "returns locations based on search parameters" do
        VCR.use_cassette("google_place_service_homeless_shelter_locations") do
          type = "homeless_shelter"
          location = "Denver"

          gpp = GooglePlacePresenter.new(type, location)

          locations = gpp.locations

          expect(locations).to be_a(Array)
          expect(locations.first).to be_a(Location)
          expect(locations.first.open_now).to eq("true")
        end
      end
    end

    describe "#first_open_location" do
      it "returns first open location" do
        VCR.use_cassette("google_place_service_homeless_shelter_locations_first_open") do
          type = "homeless_shelter"
          location = "Denver"

          gpp = GooglePlacePresenter.new(type, location)

          location = gpp.first_open_location

          expect(location).to be_a(String)
        end
      end

      it "returns no open locations nearby if city or state have no shelters" do
        VCR.use_cassette("google_place_service_incorrect_location") do
          type = "homeless_shelter"
          location = "pjpojpijad"

          gpp = GooglePlacePresenter.new(type, location)

          location = gpp.first_open_location

          expect(location).to eq("No open locations nearby. Make sure you input the city or zip code correctly.")
        end
      end
    end
  end
end
