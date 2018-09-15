class Location
  include DateTimeHelper

  attr_reader :formatted_address,
              :formatted_phone_number,
              :website,
              :open_now,
              :name,
              :hours,
              :location

  def initialize(data)
    @name = data[:result][:name]
    @formatted_address = data[:result][:formatted_address]
    @formatted_phone_number = data[:result][:formatted_phone_number]
    @website = data[:result][:website] || "Unknown"
    @open_now = data[:open_now].to_s || "Unknown"
    @hours = validate_hours(data) || "unknown"
    @location = data[:location]
  end

  def hours_status
    if @hours.length == 2 && @open_now == "true"
      return "location_open_with_hours"
    elsif @hours.length == 2 && @open_now == "false"
      return "location_closed_with_hours"
    elsif @hours[0] == "Open 24 hours"
      return "location_open_24_hours"
    elsif @hours[0] == "Closed"
      return "location_closed"
    else
      return "location_hours_unknown"
    end
  end

  private

  def validate_hours(data)
    if data[:result][:opening_hours]
      hours_for_today(data[:result][:opening_hours][:weekday_text]).split(": ")[1].gsub(/\u2013/,'-').split(" - ")
    else
      false
    end
  end
end
