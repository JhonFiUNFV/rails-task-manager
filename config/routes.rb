Rails.application.routes.draw do
  # READ ALL TASKS
  get "tasks", to: "tasks#index"
  # CREATE A TASK
  get "tasks/new", to: "tasks#new", as: "new_task"
   # READ ONE TASKS
  get "tasks/:id", to: "tasks#show", as: "task"
  # CREATE A TASK
  post "tasks", to: "tasks#create"
  # UPDATE A TASK
  get "tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "tasks/:id", to: "tasks#update"
  #  DELETE A TASK
  delete 'tasks/:id', to: 'tasks#destroy'
end
