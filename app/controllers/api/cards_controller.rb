module Api
 class CardsController < ApplicationController

   def board
     @cards = Card.all
     render json: @cards.to_json
   end

   def create
     card = Card.new
     card.title = params[:title]
     card.image = params[:image]
     card.source = params[:source]

     if card.save
       render json: card.to_json, status: 201
     else
       render json: card.errors.to_json
     end

end
