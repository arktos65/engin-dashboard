class JiraUser < ApplicationRecord
  # Associations

  # Validators
  validates_presence_of :account_id
end
