class JiraUser < ApplicationRecord
  # Associations
  has_many :members

  # Validators
  validates_presence_of :account_id
end
