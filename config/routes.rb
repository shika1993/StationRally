Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root to: 'maps#index'

  resources :users, only: [:edit, :update, :show, :destroy] do
    resources :favorites, only: [:index]
  end
  resources :stations, only: [:index, :show] do
    resources :images, only: [:create, :new, :destroy, :index] do
      resources :favorites, only: [:create]
    end
  end
end
