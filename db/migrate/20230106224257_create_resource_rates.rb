class CreateResourceRates < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_rates do |t|
      t.references :member, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.date :period_start
      t.date :period_end
      t.integer :classification, default: 0
      t.integer :rate_type, default: 0
      t.decimal :base_rate, default: 0
      t.decimal :weekly_rate, default: 0
      t.decimal :monthly_rate, default: 0
      t.decimal :annual_rate, default: 0
      t.integer :fiscal_year
      t.text :comments

      t.timestamps
    end
  end
end
