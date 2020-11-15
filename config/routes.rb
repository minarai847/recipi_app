Rails.application.routes.draw do
  
  root to: 'recipe#index'
  devise_for :users
  resources :users, only:[:edit,:update]
  resources :recipes

end
