require "rails_helper"

describe "a visitor" do
  describe "visits /" do
    it "sees a search bar and button for finding shelters" do
      visit "/"

      expect(page).to have_content("STEP 1")
      expect(page).to have_content("STEP 2")

      expect(page).to have_css(".night-shelter")
      expect(page).to have_css(".day-shelter")
      expect(page).to have_css(".food")
      expect(page).to have_css(".crisis-service")
    end
  end
end
