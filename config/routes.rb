Rails.application.routes.draw do
  root "static_page#index"
  devise_for :users
end
