Rails.application.routes.draw do
  get 'home/index'
  root "home#index"

  get    "sign_up", to: "users#new",    as: "sign_up"
  post   "sign_up", to: "users#create"

  get    "sign_in", to: "sessions#new", as: "sign_in"
  post   "sign_in", to: "sessions#create"
  delete "sessions/destroy",            as: "sign_out"

  resources :users, only: [:create, :edit]
end
