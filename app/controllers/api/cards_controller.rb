module Api
  class CardsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def show
      # @cards = Card.all
      @tag = Tag.find(params[:id])
      @user = User.find(params[:user_id])
      @cards = @tag.cards & @user.cards
      render json: @cards.to_json, status: 201
    end

    def create

      @card = Card.new
      @card.title = params[:title]
      @card.image = params[:image]
      @card.source = params[:source]
      @card.user_id = session[:id]

      country = Country.find_by(name: params[:country])
      @card.countries << country
      @card.save


      if params[:tags]
        tags = params[:tags]
        tags_Array = tags.split(',')
        tags_Array.each do |tagname|
          tagname = tagname.capitalize
          tag = Tag.find_by(name: tagname)
          @card.tags << tag
      end
      @card.save

      @array = []
      @array << @card
      @array << @card.countries
      @array << @card.tags

      render json: @array.to_json, status: 201

      end


    end

  
  end
end
