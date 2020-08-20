Rails.application.routes.draw do
  root 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resource :cart_images, only: [:create, :destroy]
  end
  resources :categories
  resources :shippings

  get '/top' => 'homes#top'
  get '/about' => 'homes#about'

  get '/search' => 'approvals#search'
  get '/permission' => 'approvals#permission'
  post '/create' => 'approvals#create'

  get '/cart_images/index' => 'cart_images#index'
end
