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


    # def trial
    #   @card = Card.new
    #   # @card.title = 'Australia'
    #   # @card.image = 'Australia'
    #   # @card.source = 'Australia'
    #   # @card.user_id = 1
    #   @card.countries << Country.find(1)
    #   @card.save
    #   render json: @card.to_json, status: 201
    # end




    def create

      @card = Card.new
      @card.title = params[:title]
      @card.image = params[:image]
      @card.source = params[:source]
      @card.user_id = params[:id]

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
      end
      @card.save

      render json: @card.to_json, status: 201



    end

    #   render json: card.to_json, status 201
    #   redirect_to '/profile'

    # end

    # def index

    # end

    # def profile
    #   @user = User.find(session[:id])
    #   @cards = @user.cards
    #   # get all the cards.countries belongs to the user
    #   @countries = []

    #   @cards.each do |card|
    #     card.countries.each do |country|
    #       if @countries.index(country) == nil
    #         @countries.push(country)
    #       end
    #     end
    #   end

    # end

    # def show

    # end

    # def show
    #   @dish = Dish.find(params[:id])
    #   render json: @dish
    # end

    # def board
    #   @user = User.find(session[:id])
    #   @tags = Tag.all
    #   @country_id = params[:country_id]
    #   @country = Country.find(@country_id)
    #   # displaying common cards between @country.cards(ALL) and user's card by using the & method
    #   @cards = @country.cards & @user.cards
    #   # currency exchange api parameters
    #   default_country = @user.default_currency
    #   dest_country = @country.name
    #   @base = IsoCountryCodes.search_by_name(default_country).first.currency
    #   @dest = IsoCountryCodes.search_by_name(dest_country).first.currency

    # end


#
  end
end
