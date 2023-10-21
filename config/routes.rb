Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/new', to: 'posts#new'
  get '/users/:user_id/posts/:post_id', to: 'posts#show'

  post '/users/:user_id/posts/create', to: 'posts#create'
  post '/users/:user_id/posts/:post_id/like_comment', to: 'likes#create'
  post '/users/:user_id/posts/:post_id/create_comment', to: 'comments#create'

  root "users#index"
  # Defines the root path route ("/")
end