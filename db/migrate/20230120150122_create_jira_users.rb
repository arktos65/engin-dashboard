class CreateJiraUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_users do |t|
      t.string :account_id
      t.string :display_name
      t.string :email_address
      t.boolean :is_active
      t.text :self_url

      t.timestamps
    end
    add_index :jira_users, :account_id, unique: true
  end
end
