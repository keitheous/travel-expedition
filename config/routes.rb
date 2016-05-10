Rails.application.routes.draw do
         #controller #method
  get '/' => 'cards#index'
  get '/signup' => 'cards#signup'
  get '/login' => 'cards#login'
  #new card page
  get '/new' => 'cards#new'
  #new card form creationaw
  post '/cards' => 'cards#create'

end
