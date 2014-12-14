Rails.application.routes.draw do

  devise_for :users
  get '/', to: 'pages#home'
  get '/personal', to: 'pages#personal'
  get '/users/update_info', to: 'users#update_info'
  get '/profile/:id', to: 'pages#profile'
  get '/chat', to: 'pages#chat'

end
