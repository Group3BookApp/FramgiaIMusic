Rails.application.routes.draw do
  root "static_pages#home"
  resources :categories, only: :index
  resources :songs, only: %i(index show)
  namespace :admin do
    resources :admin, only: :index
    resources :songs
  end
  resources :artists
end
