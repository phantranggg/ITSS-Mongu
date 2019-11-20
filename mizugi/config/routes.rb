Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  get 'products/index'
  resources :products
  root to: 'products#index'
  
  get '/cart', to: 'carts#index'
  get '/category', to: 'categories#index'
  get '/checkout', to: 'payments#checkout'
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
