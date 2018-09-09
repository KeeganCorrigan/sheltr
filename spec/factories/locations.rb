FactoryBot.define do
  factory :location do
    name { "denver rescue mission" }
    formatted_address { "1234 Lawrence Street, denver, co" }
    formatted_phone_number { "303-956-8899"}
    website { "denverrescuemission.com" }
    open_now { True }
    hours { "Sunday: 12:00 – 5:00 PM" }
  end
end
