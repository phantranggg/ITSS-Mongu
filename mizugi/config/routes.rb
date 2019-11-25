Rails.application.routes.draw do
  get 'categories/index'
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  get 'products/index'
  get 'products/update_price'
  resources :products
  root to: 'products#index'
  
  # resources :carts
  get '/carts', to: 'carts#index'
  post "carts", to: "carts#update"
  delete "carts", to: "carts#destroy"
  
  resources :categories
  get '/category', to: 'categories#index'
  get '/checkout', to: 'payments#checkout'
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
