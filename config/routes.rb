Rails.application.routes.draw do
  # HTTPVERB '/route' => 'controller#method'

  # user signup/login/logout
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#join'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#signedin'
  post '/logout' => 'sessions#logout'

  #front page
  get '/' => 'cards#index'

  #new card creation
  get '/new' => 'cards#new'
  post '/cards' => 'cards#create'

  #display user/ cards on board
  get '/board' => 'cards#board'
  get '/cards/show' => 'cards#show'
  get '/profile' => 'cards#profile'

end
