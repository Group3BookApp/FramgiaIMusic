Rails.application.routes.draw do
  root "static_pages#home"
  resources :categories, only: :index
  resources :songs, only: %i(index show)
  devise_for :users, controllers: {omniauth_callbacks:
    "users/omniauth_callbacks"}
  get "users/auth/google_oauth2", to: "sessions#create"
  get "users/auth/failure", to: redirect("/")
  get "signout", to: "devise/sessions#destroy", as: "signout"
  resource :user, only: %i(show edit update)
  namespace :admin do
    resources :admin, only: :index
    resources :songs
    resources :users, only: %i(index destroy)
  end
  resources :artists
  resources :albums
end

