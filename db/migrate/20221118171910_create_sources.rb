class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_title
      t.string :contact_phone
      t.string :contact_email
      t.boolean :is_internal

      t.timestamps
    end
  end
end
