FactoryBot.define do
  factory :project do
    association :stream
    name { Faker::Commerce.product_name }
    is_trackable { false }
    is_internal { false }
    start_date { "2023-01-10" }
    end_date { "2023-01-10" }
    is_active { true }
  end
end
