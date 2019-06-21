Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products, only: %i[index show]
  resource :card, only: %i[show]
  resources :line_items, only: %i[create destroy]
  resources :comments

  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
