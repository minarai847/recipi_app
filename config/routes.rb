Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :users
  resources :recipes do
    resources :comments
    resource :goods, only: [:create,:destroy]
  end
  


end
