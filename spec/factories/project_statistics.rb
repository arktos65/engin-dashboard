FactoryBot.define do
  factory :project_statistic do
    project_id { 1 }
    project_name { Faker::Commerce.product_name }
    stream_id { 1 }
    stream_name { "Value Stream 1" }
    week_number { Faker::Number.between(1..52) }
    month_number { Faker::Number.between(1..12) }
    year_number { Faker::Number.between(2022..2024) }
    bug_count { Faker::Number.between(0..20) }
    story_count { Faker::Number.between(0..20) }
    task_count { Faker::Number.between(0..20) }
    team_count { Faker::Number.between(1..5) }
    open_bugs { Faker::Number.between(0..20) }
    open_stories { Faker::Number.between(0..20) }
    open_tasks { Faker::Number.between(0..20) }
    closed_bugs { Faker::Number.between(0..20) }
    closed_stories { Faker::Number.between(0..20) }
    closed_tasks { Faker::Number.between(0..20) }
    dropped_bugs { Faker::Number.between(0..20) }
    dropped_stories { Faker::Number.between(0..20) }
    dropped_tasks { Faker::Number.between(0..20) }
    capex_points { Faker::Number.between(1..30) }
    opex_points { Faker::Number.between(1..20) }
    weekly_team_cost { 2500.00 }
    weekly_capex { 2000.00 }
    weekly_opex { 500.00 }
  end
end
