class AddCapexToJiraIssues < ActiveRecord::Migration[6.1]
  def change
    add_column :jira_issues, :is_capex, :boolean
  end
end
