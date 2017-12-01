class OfferSale < ActiveRecord::Base
  belongs_to :offer
  belongs_to :sale
end
