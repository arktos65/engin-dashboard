class Member < ApplicationRecord
  # Model associations
  belongs_to :role
  belongs_to :department
  belongs_to :source
end
