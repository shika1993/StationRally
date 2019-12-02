Rails.application.routes.draw do
  devise_for :users
  root to: 'maps#index'
  resources :users, only: [:edit, :update]
  resources :maps, only: [:index, :show]
    resources :images, only: [:index, :create]
end
