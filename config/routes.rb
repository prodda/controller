Rails.application.routes.draw do
  resources :tasks
  resources :no_op_tasks, controller: 'tasks', type: 'NoOpTask'
  resources :url_get_tasks, controller: 'tasks', type: 'UrlGetTask'

  root 'tasks#index'
end
