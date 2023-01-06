class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.references :role, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :is_active
      t.boolean :is_contractor
      t.string :jira_account_id

      t.timestamps
    end
    add_index :members, :jira_account_id, unique: true
  end
end
