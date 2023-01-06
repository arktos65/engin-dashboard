class Currency < ApplicationRecord
  # Model associations
  has_many :resource_rates

  # Validators
  validates :name, presence: true
  validates :code, presence: true
end
