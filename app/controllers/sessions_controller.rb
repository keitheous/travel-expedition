class SessionsController < ApplicationController


  def index

  end

  def signup
    
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

  def login
    
  end

  def new
    
  end

end