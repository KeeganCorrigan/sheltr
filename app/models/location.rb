class Location
  attr_reader :formatted_address,
              :formatted_phone_number,
              :website,
              :open_now,
              :name

  def initialize(data, open_now = nil)
    @name = data[:result][:name]
    @formatted_address = data[:result][:formatted_address]
    @formatted_phone_number = data[:result][:formatted_phone_number]
    @website = data[:result][:website] || "Unknown"
    @open_now = open_now || "Unknown"
  end
end
