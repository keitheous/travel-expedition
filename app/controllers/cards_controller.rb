class CardsController < ApplicationController

  def index

  end

  def profile
    @user = User.find(session[:id])
    @cards = @user.cards
    # get all the cards.countries belongs to the user
    @countries = []

    @cards.each do |card|
      card.countries.each do |country|
        if @countries.index(country) == nil
          @countries.push(country)
        end
      end
    end
    
  end

  def signup

  end

  def login

  end

  def new

  end


  def board
    # user_id = params[:user_id]
    #country_id = params[:country_id]
    @country = Country.first
    @cards = @country.cards
  end

  def create

    card = Card.new
    card.title = params[:title]
    card.image = params[:image]
    card.source = params[:source]
    card.user.id = sessions[:id]

    country = Country.find_by(name: params[:country])
    card.countries << country
    card.save 

    tags = [
      [:foodanddrink, "Food & Drink"],
      [:accommodation, "Accommodation"],
      [:transport, "Transport"],
      [:culture, "Culture"],
      [:entertainment, "Entertainment"],
      [:shopping, "Shopping"],
      [:nature, "Nature"],
      [:free, "Free"]
    ]

    tags.each do |tag|

        if params[tag[0]] === 'on'

          cardtag = CardTag.new
          tag_data = Tag.find_by name: tag[1]
          cardtag.tag_id = tag_data.id
          cardtag.card_id = card.id
          cardtag.save
          
        else
          puts "not on"
        end

    end

    redirect_to '/'

    end

end
