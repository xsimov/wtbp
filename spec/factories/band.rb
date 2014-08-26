FactoryGirl.define do
  factory :band do
    sequence(:name) { |n| "Band#{n}" }
    year "2008"
    styles ["Jazz", "Ballads"]

    factory :band_with_a_style do
      styles ["Jazz"]

    end
  end
end