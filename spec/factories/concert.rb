FactoryGirl.define do
  factory :concert do
    date (Date.today + 1.day)
    hour (Time.now + 1.day)
    place "Cafè René"
    additional_info "We will premiere the Gruber Songs For René"
    association :band
  end
end