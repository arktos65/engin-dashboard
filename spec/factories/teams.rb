FactoryBot.define do
  factory :team do
    association :member
    association :project
    annual_rate { 250000 }
    weekly_rate { 2000 }
    association :currency
    start_date { "2023-01-12" }
    end_date { "2023-01-12" }
    allocation { 100 }
  end
end
