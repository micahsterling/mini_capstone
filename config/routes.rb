Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/products" => "products#all_products"
    get "/silverware" => "products#silverware"
    get "/baby_cactus" => "products#baby_cactus"
    get "/query" => "products#query"
    get "/segment/:id" => "products#segment"
  end
end
