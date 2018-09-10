FactoryBot.define do
  factory :user do
    provider "google"
    uid "1238964"
    first_name "Bill"
    last_name "Brasky"
    email "bill.brasky@gmail.com"
    token "09j90japsdioj"
  end
end
