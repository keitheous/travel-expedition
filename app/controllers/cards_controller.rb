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
end
