class ChangeInventoryToQuantityForProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :inventory, :quantity
  end
end
