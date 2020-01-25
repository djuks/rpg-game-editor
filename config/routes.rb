Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  resources :characters do
    resources :abilities
  end
  resources :characters do
    resources :comments
    member do
      put "like" =>"characters#vote"
    end
  end
  resources :users, only: [:show]

end
