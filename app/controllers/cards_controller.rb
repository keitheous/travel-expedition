class CardsController < ApplicationController

  def index
    if loggedin?
      redirect_to '/profile'
    end
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

  def show
    @tag = Tag.find(params[:id])
    @user = User.find(session[:id])
    @cards = @tag.cards & @user.cards
  end

  def signup

  end

  def login

  end

  def new

  end


  def board
    @user = User.find(session[:id])
    @tags = Tag.all
    @country_id = params[:country_id]
    @country = Country.find(@country_id)
    # displaying common cards between @country.cards(ALL) and user's card by using the & method
    @cards = @country.cards & @user.cards
    # currency exchange api parameters
    default_country = @user.country
    dest_country = @country.name
    @base = IsoCountryCodes.search_by_name(default_country).first.currency
    @dest = IsoCountryCodes.search_by_name(dest_country).first.currency
    # emergency information api
    countryCode = IsoCountryCodes.search_by_name(dest_country).first.alpha2
    @numbers = get_emergency_numbers(countryCode)
  end

  def create

    card = Card.new
    card.title = params[:title]
    card.image = params[:image]
    card.source = params[:source]
    card.user_id = session[:id]

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

    redirect_to '/profile'

    end

end
