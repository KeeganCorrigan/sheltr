require "rails_helper"

describe GooglePlaceService do
  describe "instance methods" do
    describe "#locations" do
      it "returns all places from relevant search" do
        gps = GooglePlaceService.new
        type = "homeless_shelter"
        location = "Denver"

        locations = gps.locations(type, location)
        location = locations.first

        expect(locations.count).to eq(14)
        expect(location).to have_key([:result][:name])
        expect(location).to have_key([:result][:formatted_address])
        expect(location).to have_key([:result][:formatted_phone_number])
      end
    end
  end
end
