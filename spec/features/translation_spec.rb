require "rails_helper"

describe "a visitor" do
  describe "clicks on 'en espanol' button" do
    it "translates the page into spanish and back into english" do
      visit '/'

      expect(page).to have_content("en español")

      click_on("en español")

      expect(page).to_not have_content("en español")
      expect(page).to have_content("in english")
      expect(page).to have_content("CÓMO UTILIZAR")

      click_on("in english")

      expect(page).to have_content("HOW TO USE")
    end
  end
end
