class Api::CartedProductsController < ApplicationController

  def index
    render 'index.json.jb'
  end
  
  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: 1
    )
    @carted_product.save!
    render 'show.jason.jb'
  end
end
