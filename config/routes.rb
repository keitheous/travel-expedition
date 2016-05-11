Rails.application.routes.draw do
  # HTTPVERB '/route' => 'controller#method'

  # user signup/login/logout
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#join'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#signedin'
  post '/logout' => 'sessions#logout'

  #api

  # post '/api/user' => '/api/sessions# '
  post '/api/user/new' => 'api/sessions#signup'

  get '/api/card/show' => 'api/cards#show'
  post '/api/card/create' => 'api/cards#create'
  post '/api/card/trial' => 'api/cards#trial'

  #front page
  get '/' => 'cards#index'

  #new card creation
  get '/new' => 'cards#new'
  post '/cards' => 'cards#create'

  #display user/ cards on board
  get '/board' => 'cards#board'
  get '/cards/show' => 'cards#show'
  get '/profile' => 'cards#profile'

  get '/profile/edit' => 'profiles#edit'
  put '/profile/update' => 'profiles#update'

end
