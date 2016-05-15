class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.string :item
      t.boolean :above_or_below
      t.decimal :target_value
      t.string :email

      t.timestamps
    end
  end
end
