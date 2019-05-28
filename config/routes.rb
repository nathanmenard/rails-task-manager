Rails.application.routes.draw do
  root to: 'pages#home'

  get 'tasks', to: 'tasks#index'
  post 'tasks', to: 'tasks#create'
  get 'tasks', to: 'tasks#index'

  get 'tasks/new', to: 'tasks#new', as: :new_task

  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  get 'tasks/:id',      to: 'tasks#show', as: :task

  patch 'tasks/:id',    to: 'tasks#update'

  delete 'tasks/:id', to: 'tasks#destroy'

  patch 'tasks/:id/mark_as_done', to: 'tasks#mark_as_done', as: :mark_as_done
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
