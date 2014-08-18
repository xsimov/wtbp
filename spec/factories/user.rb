FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@somemail.com" }
    password "12345678"
    first_name "Xavier"
  end
end