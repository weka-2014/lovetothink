Rails.application.routes.draw do
  devise_for :users
  # get '/matches', to: 'user#matches'
  # root to: 'pages#home'
end
