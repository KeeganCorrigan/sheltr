require "rails_helper"

describe "a visitor" do
  describe "visits /" do
    it "sees a search bar and button for finding shelters" do
      visit "/"

      expect(page).to have_content("I'm in")
      expect(page).to have_content("And I need")

      expect(page).to have_css(".night_shelter")
      expect(page).to have_css(".day_shelter")
      expect(page).to have_css(".food")
      expect(page).to have_css(".crisis_service")
    end
  end
end
