class Supplier < ApplicationRecord
  def products
    # Products.where(supplier_id: id)
    has_many :products
  end
end
