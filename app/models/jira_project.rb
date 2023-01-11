class JiraProject < ApplicationRecord
  # Associations
  belongs_to :project

  # Validators
  validates_presence_of :project
  validates_presence_of :name, :jira_key, :self_url
end
