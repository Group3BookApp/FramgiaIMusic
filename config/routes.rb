Rails.application.routes.draw do
  get "sessions/new"
  get  "/signup",  to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: :destroy
  namespace :admin do
    resources :admin, only: :index
    resources :users, only: %i(index destroy)
  end
end
