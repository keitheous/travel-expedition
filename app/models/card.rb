class Card < ActiveRecord::Base 
  belongs_to :user

  has_many :country_cards, dependent: :destroy
  has_many :countries, through: :country_cards
  
  has_many :card_tags, dependent: :destroy
  has_many :tags, through: :card_tags
end
