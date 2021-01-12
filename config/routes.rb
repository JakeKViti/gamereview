Rails.application.routes.draw do
  resources :reviews
  resources :games do
    resources :reviews
  end
  resources :users do
    resources :reviews
  end

  root 'users#homepage'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/logout' => 'session#destory'
  get '/secret' => 'secrets#show'

  get '/signup' => 'user#new'
  post '/signup' => 'user#create'


  delete '/reviews/:id/' => 'review#delete'

  get '/auth/facebook/callback' => 'sessions#acreate'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
