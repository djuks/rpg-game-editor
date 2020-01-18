Rails.application.routes.draw do
  root to: "pages#home"


  devise_for :users
  resources :characters
  resources :abilities
  resources :users, only: [:show]
end
