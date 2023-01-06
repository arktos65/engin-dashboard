class CreateResourceRates < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_rates do |t|
      t.references :member, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.date :period_start
      t.date :period_end
      t.integer :classification
      t.integer :rate_type
      t.decimal :base_rate
      t.decimal :weekly_rate
      t.decimal :monthly_rate
      t.decimal :annual_rate
      t.integer :fiscal_year
      t.text :comments

      t.timestamps
    end
  end
end
