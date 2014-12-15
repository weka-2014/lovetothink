Rails.application.routes.draw do

  devise_for :users
  get '/', to: 'pages#home'
  get '/personal', to: 'pages#personal'
  devise_scope :user do
	  get '/users/update_info', to: 'users/sessions#update_info'
	end
  get '/profile/:id', to: 'pages#profile'
  get '/chat', to: 'pages#chat'

end
