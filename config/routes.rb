Rails.application.routes.draw do
  root "tarefas#index"

  resources :tarefas, except: %i[ show ] do
    collection do
      get :export_csv
    end
  end
end
