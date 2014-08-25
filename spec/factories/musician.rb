FactoryGirl.define do
  factory :musician do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@somemail.com" }
  end
end