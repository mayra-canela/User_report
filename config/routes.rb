UserReport::Application.routes.draw do
  devise_for :users

  root to: 'reports#index'


  resources :employees, only: [:new, :create, :destroy, :edit, :update,:show] 

  resources :reports, only: [:index]
end
