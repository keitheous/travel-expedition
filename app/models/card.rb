class Card < ActiveRecord::Base 
  has_many :country_cards
  has_many :countries, through: :country_cards
  
  has_many :card_tags
  has_many :tags, through: :card_tags
end
