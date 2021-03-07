class RenameSupliersToSuppliers < ActiveRecord::Migration[6.1]
  def change
    rename_table :supliers, :suppliers
  end
end
