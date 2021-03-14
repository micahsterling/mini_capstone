class ChangeCategory < ActiveRecord::Migration[6.1]
  def change
    rename_table :catergories, :categories
  end
end
