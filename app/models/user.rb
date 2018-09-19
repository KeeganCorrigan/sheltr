class User < ApplicationRecord
  enum role: ["default", "admin"]

  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_initialize.tap do |user|
      user.email = auth[:info][:email]
      user.uid = auth[:uid]
      user.provider = auth[:provider]
      user.first_name = auth[:info][:first_name]
      user.last_name = auth[:info][:last_name]
      user.token = auth[:credentials][:token]
      user.save!
    end
  end
end
