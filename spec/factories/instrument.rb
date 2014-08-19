FactoryGirl.define do
  factory :instrument do
    sequence(:nickname) { |n| "Piano#{n}" }
  end
end