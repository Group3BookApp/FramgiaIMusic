Rails.application.routes.draw do
  root "static_pages#home"
  resources :categories, only: :index
  resources :songs, only: :index
  namespace :admin do
    resources :admin, only: :index
  end
  resources :artists
end
