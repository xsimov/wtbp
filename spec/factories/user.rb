FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@somemail.com" }
    password "12345678"
    first_name "Xavier"

    factory :user_authed do
      confirmed_at Time.now
    end
  end
end