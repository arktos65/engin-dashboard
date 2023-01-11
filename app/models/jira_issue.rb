class JiraIssue < ApplicationRecord
  # Associations
  belongs_to :jira_project

  # Validators
  validates_presence_of :jira_project
  validates_presence_of :issue_key, :issue_url, :issue_title, :issue_status, :issue_type
end
