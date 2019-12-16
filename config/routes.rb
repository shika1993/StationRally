Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root to: 'maps#index'
  resources :users, only: [:edit, :update, :destroy]
  resources :maps, only: [:index, :show]
  resources :stations, only: [:index, :show] do
    resources :images, only: [:create, :new, :destroy, :index]
  end
end
