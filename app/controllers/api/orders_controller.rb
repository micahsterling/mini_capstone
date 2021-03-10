class Api::OrdersController < ApplicationController
  def create
    p "current_user"
    p current_user
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      # subtotal: ,
      # total: ,
      # tax:  ,
    )
    render 'show.json.jb'
  end
end
