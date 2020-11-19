Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    resources :comments
    resource :goods, only: [:create,:destroy]
  end
  resources :users


end
