class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
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
    @product.save
    render 'show.json.jb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = "watering can"
    @product.image_url = "url goes here"
    @product.description = "used for watering plants"
    @price = 20
    render 'show.json.jb'
  end
end
