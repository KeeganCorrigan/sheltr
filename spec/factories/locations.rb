FactoryBot.define do
  factory :location do
    name  "denver rescue mission"
    formatted_address  "2301 Lawrence St, Denver, CO 80205, USA"
    formatted_phone_number  "(303) 294-0241"
    website  "denverrescuemission.com"
    open_now  "true"
    hours  ["4:30 PM", "8:00 AM"]
    location [39.7555567, -104.9881021]
  end
end
