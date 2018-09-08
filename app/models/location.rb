class Location
  include DateTimeHelper

  attr_reader :formatted_address,
              :formatted_phone_number,
              :website,
              :open_now,
              :name,
              :hours

  def initialize(data, open_now = nil)
    @name = data[:result][:name]
    @formatted_address = data[:result][:formatted_address]
    @formatted_phone_number = data[:result][:formatted_phone_number]
    @website = data[:result][:website] || "Unknown"
    @open_now = open_now || "Unknown"
    @hours = validate_hours(data) || "unknown"
  end

  def validate_hours(data)
    if data[:result][:opening_hours]
      hours_for_today(data[:result][:opening_hours][:weekday_text]).split(": ")[1].gsub(/\u2013/,'-').split(" - ")
    else
      false
    end
  end
end
