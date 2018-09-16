require "rails_helper"

describe Location, type: :model do
  it "has attributes" do
    location_data = {
                      result:
                        {
                          formatted_address: "iojasdoij",
                          formatted_phone_number: "0909jiad",
                          website: "0j09j90ajdpoad",
                          name: "ij90jasp",
                          opening_hours: {
                             weekday_text: ["Monday: 10:00 AM – 5:00 PM",
                             "Tuesday: Closed",
                             "Wednesday: 10:00 AM – 5:00 PM",
                             "Thursday: 10:00 AM – 5:00 PM",
                             "Friday: 10:00 AM – 5:00 PM",
                             "Saturday: 11:00 AM – 5:00 PM",
                             "Sunday: 12:00 – 5:00 PM"]
                          }
                        },
                      open_now: true,
                      location: [39.7555567, -104.9881021],
                      place_id: 1
                    }

    location_1 = Location.new(location_data)

    expect(location_1.formatted_address).to eq(location_data[:result][:formatted_address])
    expect(location_1.formatted_phone_number).to eq(location_data[:result][:formatted_phone_number])
    expect(location_1.website).to eq(location_data[:result][:website])
    expect(location_1.name).to eq(location_data[:result][:name])
    expect(location_1.location).to eq(location_data[:location])
    expect(location_1.place_id).to eq(location_data[:place_id])
    expect(location_1.open_now).to eq("true")
    expect(location_1.hours.class).to eq(Array)
    expect(location_1.hours.class).to_not eq("unknown")
  end

  describe "instance methods" do
    describe "#validate_hours" do
      it "validates presence of hours and returns unknown if not present" do
        location_data = {
                          result:
                            {
                              formatted_address: "iojasdoij",
                              formatted_phone_number: "0909jiad",
                              website: "0j09j90ajdpoad",
                              name: "ij90jasp",
                            },
                          open_now: true,
                          location: [39.7555567, -104.9881021],
                          place_id: 1
                        }

        open_data = true

        location_1 = Location.new(location_data)

        expect(location_1.hours).to eq("unknown")
      end
    end

    describe "#open_status" do
      it "returns string to render partial based on hours and open status" do
        location_data = {
                          result:
                            {
                              formatted_address: "iojasdoij",
                              formatted_phone_number: "0909jiad",
                              website: "0j09j90ajdpoad",
                              name: "ij90jasp",
                              opening_hours: {
                                 weekday_text: ["Monday: 10:00 AM – 5:00 PM",
                                 "Tuesday: 10:00 AM – 5:00 PM",
                                 "Wednesday: 10:00 AM – 5:00 PM",
                                 "Thursday: 10:00 AM – 5:00 PM",
                                 "Friday: 10:00 AM – 5:00 PM",
                                 "Saturday: 11:00 AM – 5:00 PM",
                                 "Sunday: 12:00 – 5:00 PM"]
                              }
                            },
                          open_now: "true",
                          location: [39.7555567, -104.9881021],
                          place_id: 1
                        }

        location = Location.new(location_data)
        expect(location.hours_status).to eq("location_open_with_hours")
      end
    end
  end
end
