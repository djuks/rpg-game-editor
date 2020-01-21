Rails.application.routes.draw do
  root to: "pages#home"


  devise_for :users
  resources :characters do
    resources :abilities
  end
  resources :users, only: [:show]
  get 'characters/:id', to: 'abilities#create'
end
