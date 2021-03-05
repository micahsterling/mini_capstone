class Api::ProductsController < ApplicationController
  def index
  
    # @products = Product.order([{param[:sort] => params[:sort_order])

    if params[:discount] == "true" 
      @products = Product.where("price < 10")
    elsif params[:sort] == "price" && params[:sort_order] == "asc"
      @products = Product.order({price: :asc})
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = Product.order({price: :desc})
    else
      @products = Product.all
    end
    # {"sort"=>"price", "sort_order"=>"asc"}
    render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
    name: params[:name],
    image_url: params[:image_url],
    description: params[:description],
    price: params[:price],
    )
    if @product.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {message: @product.errors.full_messages}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.price = params[:price] || @product.price
    @product.save
    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "you deleted the product"}
  end
end
