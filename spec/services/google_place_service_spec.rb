require "rails_helper"

describe GooglePlaceService do
  describe "instance methods" do
    describe "#locations" do
      it "returns all places from relevant homeless shelter search" do
        VCR.use_cassette("google_place_service_homeless_shelter_locations") do
          gps = GooglePlaceService.new
          type = "homeless_shelter"
          location = "Denver"

          locations = gps.locations(type, location)
          location = locations.first

          expect(locations.count).to eq(10)
          expect(location).to have_key(:result)
          expect(location[:result]).to have_key(:formatted_address)
          expect(location[:result]).to have_key(:formatted_phone_number)
        end
      end

      it "returns all places from relevant library search" do
        VCR.use_cassette("google_place_service_library_locations") do
          gps = GooglePlaceService.new
          type = "library"
          location = "Denver"

          locations = gps.locations(type, location)
          location = locations.first

          expect(locations.count).to eq(20)
          expect(location).to have_key(:result)
          expect(location[:result]).to have_key(:formatted_address)
          expect(location[:result]).to have_key(:formatted_phone_number)
        end
      end

      it "returns all places from relevant food search" do
        VCR.use_cassette("google_place_free_food_locations") do
          gps = GooglePlaceService.new
          type = "food+for+homeless"
          location = "Denver"

          locations = gps.locations(type, location)
          location = locations.first

          expect(locations.count).to eq(20)
          expect(location).to have_key(:result)
          expect(location[:result]).to have_key(:formatted_address)
          expect(location[:result]).to have_key(:formatted_phone_number)
        end
      end

      it "returns all places from relevant crisis search" do
        VCR.use_cassette("google_place_crisis_center_locations") do
          gps = GooglePlaceService.new
          type = "crisis+service"
          location = "Denver"

          locations = gps.locations(type, location)
          location = locations.first

          expect(locations.count).to eq(20)
          expect(location).to have_key(:result)
          expect(location[:result]).to have_key(:formatted_address)
          expect(location[:result]).to have_key(:formatted_phone_number)
        end
      end
    end
  end
end
