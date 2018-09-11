require "rails_helper"

describe "a visitor" do
  describe "texts denver to 7207353029" do
    it "receives a text with the information for the first currently open shelter" do
      VCR.use_cassette("google_place_service_homeless_shelter_locations_SMS") do

        to_number = "3039568351"
        from_number = "17207353029"

        visit "/messages/reply?Body=Denver&From=#{to_number}"

        last_message = FakeSMS.messages.last

        expect(last_message).to be_a(FakeSMS::Message)
        expect(last_message.data[:from]).to eq(from_number)
        expect(last_message.data[:to]).to eq(to_number)
        expect(last_message.data[:body]).to be_a(String)
      end
    end
  end
end
