class AddJiraUserToMember < ActiveRecord::Migration[6.1]
  def change
    add_reference :members, :jira_user, null: false, foreign_key: true
    remove_index :members, :name => 'index_members_on_jira_account_id'
    remove_column :members, :jira_account_id
  end
end
