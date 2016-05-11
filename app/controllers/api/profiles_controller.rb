# class ProfilesController < ApplicationController
#   def edit
#     @user = User.find(params[:id])
#   end
#   def update
#     user = User.find(params[:id])
#     user.name = params[:name];
#     user.email = params[:email]
#     user.default_currency = params[:default_currency]
#     user.image_url = params[:image_url]
#     if user.save
#       redirect_to '/profile'
#     else
#       redirect_to "/profile/edit?id=#{params[:id]}"
#     end
#   end
# end
