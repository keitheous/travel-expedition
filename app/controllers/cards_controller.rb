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

end