Rails.application.routes.draw do
  resources :attractions
  resources :users
  root "users#index"

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  get '/show' => 'sessions#show'

  delete '/logout', to: 'sessions#destroy'

  patch '/rides', to: 'rides#update'


end
