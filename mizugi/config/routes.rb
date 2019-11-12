Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
