FactoryGirl.define do
  factory :band do
    sequence(:name) { |n| "Band#{n}" }
    year "2008"
    styles []

    factory :band_with_a_style do
      styles ["Jazz"]

      factory :band_with_many_styles do
        styles ["Jazz", "Ballads"]
      end
    end
  end
end