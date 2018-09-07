require "rails_helper"

describe Location, type: :model do
  it "has attributes" do
    location_data = {
                      result:
                        {
                          formatted_address: "iojasdoij",
                          formatted_phone_number: "0909jiad",
                          website: "0j09j90ajdpoad",
                          name: "ij90jasp"
                        }
                    }

    open_data = true

    location_1 = Location.new(location_data, open_data)

    expect(location.formatted_address).to eq(location_data[:result][:formatted_address])
    expect(location.formatted_phone_number).to eq(location_data[:result][:formatted_phone_number])
    expect(location.website).to eq(location_data[:result][:website])
    expect(location.name).to eq(location_data[:result][:name])
    expect(location.open_now).to eq(open_data)
  end
end
