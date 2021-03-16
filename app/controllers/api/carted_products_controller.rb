class Api::CartedProductsController < ApplicationController

  def index
    # @carted_products = CartedProduct.all
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end
  
  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted"
    )
    p "current user"
    p current_user
    p "after current user"
    @carted_product.save
    render 'show.jason.jb'
  end
end
