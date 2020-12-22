Rails.application.routes.draw do
  resources :reviews
  resources :games
  resources :users 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/logout' => 'session#destory'
  get '/secret' => 'secrets#show'


  delete '/reviews/:id/' => 'review#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
