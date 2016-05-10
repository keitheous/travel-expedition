Rails.application.routes.draw do
  get '/' => 'cards#index'
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#join'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#signedin'
  get '/new' => 'cards#new'
end
