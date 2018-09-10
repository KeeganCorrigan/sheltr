require "rails_helper"

describe "a user visits / " do
  describe "clicks on login" do
    it "can login" do
      stub_omniauth

      visit "/"

      click_on "Login"

      expect(current_path).to eq("/")

      # expect(page).to have_content("Logout")
      # expect(page).to_not have_content("Login")
      expect(User.count).to eq(1)
    end
  end
end
