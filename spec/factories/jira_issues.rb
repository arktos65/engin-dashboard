FactoryBot.define do
  factory :jira_issue do
    association :jira_project
    jira_issue_id { Faker::Number }
    issue_key { Faker::IDNumber }
    issue_url { Faker::Internet.url }
    issue_title { Faker::Lorem.paragraph}
    issue_status { "Open" }
    issue_type { "Story" }
    story_points { 1 }
    issue_created { Faker::Date.backward(days: 7) }
    issued_updated { Faker::Date.backward(days: 3) }
  end
end
