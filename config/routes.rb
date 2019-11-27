Rails.application.routes.draw do
  devise_for :users
  root to: 'maps#index'
  resources :maps, only: [:index, :show]
end
