require "rails_helper"

describe "an admin user" do
  describe "visits admin dashboard" do
    it "can view unapproved comments and approve them" do
      admin = create(:user, role: 1)
      

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)



    end
  end
end
