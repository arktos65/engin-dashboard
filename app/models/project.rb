class Project < ApplicationRecord
  # Associations
  belongs_to :stream

  # Validators
  validates_presence_of :stream
  validates_presence_of :name
end
