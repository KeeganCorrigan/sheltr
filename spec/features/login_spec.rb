require "rails_helper"

describe "a user visits / " do
  describe "clicks on login" do
    it "can login" do
      stub_omniauth

      visit "/"

      click_on "Login"

      expect(current_path).to eq("/")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Dashboard")

      expect(User.count).to eq(1)

      click_on "Logout"

      expect(page).to have_content("Login")
    end
  end

  describe "only an admin can view dashboard link" do
    it "logs in as admin" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit "/"

      expect(page).to have_content("Dashboard")
      
      click_on "Dashboard"

      expect(current_path).to eq ("/admin/dashboard")
    end
  end
end
