UserReport::Application.routes.draw do
  root to: 'reports#index'

  resources :employees, only: [:new, :create, :destroy, :edit, :update]
end
