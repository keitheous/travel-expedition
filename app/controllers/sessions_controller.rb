class SessionsController < ApplicationController


  def index

  end

  def signup
    
  end

  def login

  end

  def join
    user = User.new
    user.name = params[:name].downcase
    user.email =params[:email]
    user.password = params[:password]
    user.save
    session[:id] = user.id
    redirect_to "/profile"
  end

  def signedin
    user = User.find_by(name: "#{params[:username].downcase}" )
      if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect_to "/profile"
      else
        session[:attempt] = true
      end

  end


  def new
    
  end

end