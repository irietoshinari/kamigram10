Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :styles do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end

end
