FactoryBot.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    association :role
    association :department
    association :source
    start_date { "2023-01-06" }
    end_date { "2023-01-06" }
    is_active { false }
    is_contractor { false }
    association :jira_user
  end
end
