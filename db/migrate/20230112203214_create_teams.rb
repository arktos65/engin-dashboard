class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :member, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :annual_rate
      t.integer :weekly_rate
      t.references :currency, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :allocation

      t.timestamps
    end
  end
end
