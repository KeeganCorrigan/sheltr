require "rails_helper"

describe "a visitor" do
  describe "visits /" do
    it "sees a search bar and button for finding shelters" do
      visit "/"

      expect(page).to have_content("I need a place to stay")

      expect(page).to have_css(".search")
    end
  end
end
# As a visitor
# When I visit /
# I see a page that has a search bar for city of zip code
# I see a button that says I need a place to stay
