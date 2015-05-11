Rails.application.routes.draw do
  get 'home/index'
  root "home#index"

  get    "sign_up", to: "users#new",    as: "sign_up"
  post   "sign_up", to: "users#create"

  get    "sign_in", to: "sessions#new", as: "sign_in"
  post   "sign_in", to: "sessions#create"
  delete "sessions/destroy",            as: "sign_out"


  put "lists/:id/", to: "lists#archive", as: "archive_list"
  resources :users, only: [:create, :edit, :update]
  resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy, :archive_index]

  patch "list/:list_id/task/:id/", to: "tasks#complete", as: "complete_task"
  get  "list/archive", to: "lists#archive_index", as: "archive"
  get  "complete/tasks/:id/", to: "lists#completed_tasks", as: "completed_tasks"

  resources "list" do
    resources :tasks
  end

  post "list/:id/archive", to: "lists#archive", as: "list_archive"
end
