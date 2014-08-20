FactoryGirl.define do
  factory :instrument do
    sequence(:name) { |n| "Piano#{n}" }
  end
end