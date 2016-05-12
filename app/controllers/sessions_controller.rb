class SessionsController < ApplicationController

  def index
  end

  def signup
    session[:username] = nil
    session[:country] = nil
    session[:email] = nil
  end

  def login
  end

  def join
    if User.find_by(name: params[:name]) || !Country.find_by(name: params[:country]) || !is_a_valid_email?(params[:email])
      if User.find_by(name: params[:name])
        session[:username] = true
      end
      if !Country.find_by(name: params[:country])
        session[:country] = true
      end
      if !is_a_valid_email?(params[:email])
        session[:email] = true
      end
      render :signup
    else
      user = User.new
      user.name = params[:name].downcase
      user.email =params[:email]
      user.password = params[:password]
      user.country = params[:country]
      user.save
      session[:id] = user.id
      redirect_to "/profile"
    end
  end

  def signedin
    user = User.find_by(name: "#{params[:name].downcase}" )
      if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect_to '/profile'
      else
        redirect_to '/login'
      end
  end


  def logout
    session[:id] = nil
    redirect_to "/"
  end

end
