Rails.application.routes.draw do
  get 'products/index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
