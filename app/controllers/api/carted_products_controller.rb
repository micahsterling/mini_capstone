class Api::CartedProductsController < ApplicationController

  def index
    # @carted_products = CartedProduct.all
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user)
    else
      @carted_products = []
    end
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
