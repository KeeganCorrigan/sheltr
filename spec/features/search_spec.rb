require "rails_helper"

describe "a visitor" do
  context "visits /" do
    xit "enters a zip code and clicks on search" do
      visit "/"

      fill_in :q, with: "80204"

      click_on "Search"

      expect(current_path).to eq("/search")

      click_on "Shelters"

      expect(page).to have_css(".shelter")

      within(first(".shelter")) do
        expect(page).to have_css(".address")
        expect(page).to have_css(".phone_number")
        expect(page).to have_css(".website")
        expect(page).to have_css(".hours")
      end
    end
  end
end


# As a visitor
# When i enter a zip code or city into the search bar on root
# and click on I need a place to stay
# I am taken to a page that lists the closest shelters with the following information:
# address
# phone number
# web address
# hours (including whether they are open)
