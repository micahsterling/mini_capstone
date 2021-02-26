class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    render 'show.json.jb'
  end


















  # def silverware
  #   @product = Product.find_by(id: 1)
  #   render 'silverware.json.jb'
  # end


  # def baby_cactus
  #   @product = Product.find_by(id: 2)
  #   render 'baby_cactus.json.jb'
  # end
  # def query
  #   output = {id: params[:id]}
  #   @product = Product.find_by(output)
  #   render 'query.json.jb'
  # end

  # def segment
  #   output = {id: params[:id]}
  #   @product = Product.find_by(output)
  #   render "segment.json.jb"
  # end
end
