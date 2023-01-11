class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :stream, null: false, foreign_key: true
      t.string :name
      t.boolean :is_trackable
      t.boolean :is_internal
      t.date :start_date
      t.date :end_date
      t.boolean :is_active

      t.timestamps
    end
  end
end
