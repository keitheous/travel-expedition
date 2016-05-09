Rails.application.routes.draw do
  get '/' => 'cards#index'
  get '/signup' => 'cards#signup'
  get '/login' => 'cards#login'
  get '/new' => 'cards#new'
end
