require "rails_helper"

describe "a visitor" do
  context "visits /" do
    it "enters a zip code and clicks on I NEED SLEEP" do
      VCR.use_cassette("google_place_service_homeless_shelter_locations") do
        visit "/"

        fill_in :q, with: "Denver"

        click_on "I NEED SLEEP"

        expect(current_path).to eq("/search")

        expect(page).to have_css(".location")

        within(first(".location")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".formatted_address")
          expect(page).to have_css(".formatted_phone_number")
          expect(page).to have_css(".website")
          expect(page).to have_css(".hours")
        end
      end
    end
  end
end
