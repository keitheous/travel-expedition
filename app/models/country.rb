class Country < ActiveRecord::Base
  has_many :country_cards
  has_many :cards, through: :country_cards
end
