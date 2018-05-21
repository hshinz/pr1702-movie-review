Rails.application.routes.draw do
  root "static_page#home"

  get "/sign_in", to: "devise/sessions#new"
  get "/sign_up", to: "devise/registrations#new"
  devise_for :users
  resources :movies
end
