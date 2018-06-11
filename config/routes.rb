Rails.application.routes.draw do
  root "static_page#home"

  devise_for :users
  resources :users
  resources :movies do
    resources :comments
    resources :reviews
  end
  resources :movies
  resources :reviews
  namespace :admin do
    resources :users
    resources :movies
    resources :reviews
    resources :comments
    resources :genres
    resources :descriptions
  end

end
