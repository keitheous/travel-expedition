module Api
class SessionsController < ApplicationController

  def signup
    if User.find_by(name: params[:name]) || !Country.find_by(name: params[:country])
      redirect_to '/signup'
    else
      @user = User.new
      @user.name = params[:name].downcase
      @user.email =params[:email]
      @user.password = params[:password]
      @user.country = params[:country]
      @user.save
      session[:id] = user.id
      render json: @user.to_json, status: 201
    end
  end


end

end