Rails.application.routes.draw do
  root to: 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, except: [:edit, :update]
end
