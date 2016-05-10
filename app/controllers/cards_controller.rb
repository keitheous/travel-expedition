class CardsController < ApplicationController
  def index

  end

  def signup

  end

  def login

  end

  def new

  end


  def board
    @cards = Card.all
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
