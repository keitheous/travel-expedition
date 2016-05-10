class SessionsController < ApplicationController

enable :sessions

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
    sessions[:id] = user.id
    render "/profile?id=#{user.id}"  
  
end


  def login
    
  end

  def new
    
  end

end