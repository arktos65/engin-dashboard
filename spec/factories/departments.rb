# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    division { Faker::Business.name }
  end
end
