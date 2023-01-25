class ProjectStatistic < ApplicationRecord
  # Associations
  belongs_to :project

  # Validators
  validates_presence_of :project
  validates_presence_of :stream_id, :stream_name
end
