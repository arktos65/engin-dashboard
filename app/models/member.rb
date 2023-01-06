class Member < ApplicationRecord
  # Model associations
  belongs_to :role
  belongs_to :department
  belongs_to :source

  has_many :resource_rates
end
