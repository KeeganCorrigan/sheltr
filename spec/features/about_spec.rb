require "rails_helper"

describe "a visitor" do
  describe "visits about page" do
    it "sees information about the app" do
      visit "/about"

      expect(page).to have_content "ABOUT"
    end
  end
end
