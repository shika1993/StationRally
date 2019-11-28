Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'maps#index'
  resources :maps, only: [:index, :show]
end
