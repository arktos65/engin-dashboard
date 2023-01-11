class CreateJiraIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_issues do |t|
      t.references :jira_project, null: false, foreign_key: true
      t.integer :jira_issue_id
      t.string :issue_key
      t.text :issue_url
      t.text :issue_title
      t.string :issue_status
      t.string :issue_type
      t.integer :story_points
      t.datetime :issue_created
      t.datetime :issued_updated

      t.timestamps
    end
  end
end
