class Member < ApplicationRecord
  # Model associations
  belongs_to :role
  belongs_to :department
  belongs_to :source

  has_many :resource_rates

  # Returns name in 'last, first' format
  def full_name
    last_name + ", " + first_name
  end
end
