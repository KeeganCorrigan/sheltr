class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reply
    binding.pry
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    @presenter = GooglePlacePresenter.new("homeless_shelter", message_body)

    sms = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: from_number,
      body: "#{@presenter.first_open_location}"
    )

    binding.pry
  end

  private

  def boot_twilio
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
