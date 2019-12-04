Rails.application.routes.draw do
  devise_for :users
  root to: 'maps#index'
  resources :users, only: [:edit, :update]
  resources :maps, only: [:index, :show]
  resources :stations, only: [:index, :show] do
    resources :images, only: [:create, :update, :edit, :destroy, :index]
  end
end
