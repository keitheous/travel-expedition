Rails.application.routes.draw do
  get '/' => 'cards#index'
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#signup'
  get '/login' => 'cards#login'
  get '/new' => 'cards#new'
  get '/board' => 'cards#board'
end
