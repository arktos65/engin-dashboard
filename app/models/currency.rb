class Currency < ApplicationRecord
  # Model associations

  # Validators
  validates :name, presence: true
  validates :code, presence: true
end
