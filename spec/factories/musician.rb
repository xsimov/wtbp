FactoryGirl.define do
  factory :musician do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@somemail.com" }
    first_name "Kail"
    last_name "Laurence"
    aliases ["kail", "kail d'arabia"]
    birth_date Date.today - 25.years
    password "12345678"
    password_confirmation "12345678"
  end
end