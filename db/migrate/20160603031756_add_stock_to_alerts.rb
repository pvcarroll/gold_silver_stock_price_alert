class AddStockToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :stock, :string
  end
end
