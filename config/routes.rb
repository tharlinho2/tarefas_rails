Rails.application.routes.draw do
  root "tarefas#index"

  resources :tarefas, except: %i[ show ]
end
