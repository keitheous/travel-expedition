class CountryCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :country
end
