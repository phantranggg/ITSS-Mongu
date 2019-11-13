Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  get 'products/index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products
  root to: 'products#index'
  get '/cart', to: 'carts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
