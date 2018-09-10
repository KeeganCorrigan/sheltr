require 'rails_helper'

describe User, type: :model do
  it "has attributes" do
    data = {
              provider: "google",
              uid: "12345678910",
              info: {
                email: "keegan.rw.corrigan@gmail.com",
                first_name: "keegan",
                last_name: "corrigan"
              },
              credentials: {
                token: "thisisfake"
              }
            }

    user = User.from_omniauth(data)

    expect(user.provider).to eq(data[:provider])
    expect(user.uid).to eq(data[:uid])
    expect(user.email).to eq(data[:info][:email])
    expect(user.first_name).to eq(data[:info][:first_name])
    expect(user.last_name).to eq(data[:info][:last_name])
    expect(user.token).to eq(data[:credentials][:token])
  end
end
