Rails.application.routes.draw do

  get '/mypage' => 'users#mypage'
  devise_for :users
  root to: 'recipes#index'
  resources :users
  resources :recipes do
  end


end
