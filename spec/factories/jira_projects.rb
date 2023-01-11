FactoryBot.define do
  factory :jira_project do
    association :project
    jira_project_id { Faker::Number }
    name { Faker::Business.name }
    jira_key { Faker::IDNumber}
    total_issue_count { 1 }
    last_issue_update { "2023-01-10 15:15:43" }
    self_url { Faker::Internet.url }
  end
end
