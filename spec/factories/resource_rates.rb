FactoryBot.define do
  factory :resource_rate do
    association :member
    association :currency
    period_start { Faker::Date.backward(days: 180) }
    period_end { Date.today }
    classification { 1 }
    rate_type { 1 }
    base_rate { "9.99" }
    weekly_rate { "9.99" }
    monthly_rate { "9.99" }
    annual_rate { "9.99" }
    fiscal_year { Date.today.year }
    comments { "MyText" }
  end
end
