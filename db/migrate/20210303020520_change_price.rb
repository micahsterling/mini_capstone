class ChangePrice < ActiveRecord::Migration[6.1]
  def change
    # change price to decimal
    change_column :products,:price, :decimal, precision: 6, scale:2 
    # change description to text
    change_column :products,:description, :text,
  end
end
