FactoryBot.define do
  factory :role do
    name { Faker::Company.profession }
    is_shared { false }
    is_administration { false }
    association :department
  end
end
