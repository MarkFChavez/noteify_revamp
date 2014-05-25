Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :notes, only: [:new, :create, :destroy]
  resources :archives, only: [:index]
end
