Rails.application.routes.draw do
  root "static_page#home"

  devise_for :users
  resources :users do
    resources :comments
    resources :reviews
  end
  resources :movies do
    resources :comments
    resources :reviews
  end
end
