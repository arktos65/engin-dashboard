# frozen_string_literal: true

FactoryBot.define do
  factory :source do
    name { Faker::Business.name }
    contact_name { Faker::Name.name }
    contact_title { Faker::Job.title }
    contact_phone { Faker::PhoneNumber }
    contact_email { Faker::Internet.safe_email }
    is_internal { false }
  end
end
