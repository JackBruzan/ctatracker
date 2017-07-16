Rails.application.routes.draw do
  resources :routes
  resources :schedules
  devise_for :users
  root "schedules#index"
end
