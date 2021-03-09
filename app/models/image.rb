class Image < ApplicationRecord
  def products
    belongs_to :products
  end
end
