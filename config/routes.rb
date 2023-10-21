Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  get '/posts/:post_id/comments/new', to: 'comments#new'
  get '/users/:user_id/posts/new', to: 'posts#new'

  get '/home', to: 'users#index'
  root 'users#index'

  post '/users/:user_id/posts/create', to: 'posts#create'
  post '/users/:user_id/posts/:post_id/like_comment', to: 'likes#create'
  post '/users/:user_id/posts/:post_id/create_comment', to: 'comments#create'
  # Defines the root path route ("/")
end