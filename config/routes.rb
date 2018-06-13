Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_page#home"

  devise_for :users
  resources :users
  resources :movies do
    collection do
      get :top
    end
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
  resources :watchlists, only: [:create, :destroy]
end
