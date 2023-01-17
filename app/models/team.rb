class Team < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :project
  belongs_to :currency
end
