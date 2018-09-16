require "rails_helper"

describe Comment, type: :model do
  it "has attributes" do
   it { should validate_presence_of(:body) }
   it { should validate_presence_of(:place_id) }
   it { should validate_presence_of(:approved?) }
  end
end
