class CardsController < ApplicationController

  def index
    @user = User.first
    @cards = @user.cards
    @countries = []
    @cards.each do |card|
      @countries.push(card.countries)
    end
    @countries.join(",")
    @countries.uniq!

  end

  def signup
    
  end

  def login
    
  end

  def new
    
  end

  def create

    card = Card.new
    card.title = params[:title]
    card.image = params[:image]
    card.source = params[:source]
    #tag shit #cards_tags

    if card.save

    redirect_to '/'

    else 
    
    redirect_to '/new'

    end

  end


end