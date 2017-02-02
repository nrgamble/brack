Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tournaments
  resources :brackets
  resources :pools
  resources :teams
  resources :games
  
  root :to => 'pages#index'

  #devise_for :users

end
