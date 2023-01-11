class CreateStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :streams do |t|
      t.string :name
      t.string :business_unit
      t.string :stakeholder_name
      t.string :stakeholder_email

      t.timestamps
    end
  end
end
