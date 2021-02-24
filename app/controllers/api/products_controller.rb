class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'all_products.json.jb'
  end

  def silverware
    @product = Product.find_by(id: 1)
    render 'silverware.json.jb'
  end
end
