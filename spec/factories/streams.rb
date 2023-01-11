FactoryBot.define do
  factory :stream do
    name { Faker::Commerce.product_name }
    business_unit { Faker::Commerce.department }
    stakeholder_name { Faker::Name.name }
    stakeholder_email { Faker::Internet.email }
  end
end
