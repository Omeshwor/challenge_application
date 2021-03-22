Rails.application.routes.draw do
  root "challenges#index"
  resources :challenges
  devise_for :users
  resources :users, only: [:index]
  resources :friendships, only:[:index, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :competitors, only: [:create, :destroy]
end
