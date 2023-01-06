class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.decimal :exchange_rate

      t.timestamps
    end
    add_index :currencies, :code, unique: true
  end
end
