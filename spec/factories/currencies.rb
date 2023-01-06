FactoryBot.define do
  factory :currency do
    name { Faker::String.random }
    code { Faker::String.random }
    exchange_rate { 1.5 }
  end
end
