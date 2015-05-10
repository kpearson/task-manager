Rails.application.routes.draw do
  get 'home/index'
  root "home#index"
  get "users/new", as: "sign_up"
  resources :users, only: [:new, :create]
end
