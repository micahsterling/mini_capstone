class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    @orders = current_user.orders
    # @orders = Order.all
    render 'index.json.jb'
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.jason.jb'
  end

  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    
    calculated_total = 0
    calculated_tax = 0
    @carted_products.each do |carted_product|
      calculated_total += carted_product.product.price * carted_product.quantity
      calculated_tax += carted_product.product.tax * carted_product.quantity
    end
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_total,
      total: calculated_total + calculated_tax,
      tax: calculated_tax,      
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: @order.id)
    end
    
    render 'show.json.jb'
  end
end
