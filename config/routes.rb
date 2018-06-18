Rails.application.routes.draw do
  root "static_page#home"

  devise_for :users
  resources :users
  resources :movies do
    resources :reviews
  end
  namespace :admin do
    resources :users
    resources :movies
    resources :reviews
    resources :comments
    resources :genres
    resources :descriptions
  end
  resources :like_reviews, only: :create
  resources :watchlists, only: :create
end
