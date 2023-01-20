FactoryBot.define do
  factory :jira_user do
    account_id { Faker::Internet.device_token }
    display_name { Faker::Name.name }
    email_address { Faker::Internet.email }
    is_active { true }
    self_url { Faker::Internet.url }
  end
end
