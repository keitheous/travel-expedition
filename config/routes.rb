Rails.application.routes.draw do
         #controller #method
  get '/' => 'cards#index'
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#join'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#signedin'
  #new card page
  get '/new' => 'cards#new'

  get '/board' => 'cards#board'

  #new card form creationaw
  post '/cards' => 'cards#create'




  get '/profile' => 'cards#profile'

end
