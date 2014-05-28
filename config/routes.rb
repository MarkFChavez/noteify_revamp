Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :notes, only: [:new, :create, :destroy]
  resources :archives, only: [:index]
  resources :users, only: [:index]
  resources :relationships, only: [:create]
end
