Rails.application.routes.draw do
  root 'users#index'
  
  get 'admin' , to: 'access#login'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get '/login' , to: 'session#create'
  get '/login' , to:'session#new'
  get '/logout' , to:'session#destroy'
end
