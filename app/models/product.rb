class Product < ActiveRecord::Base
  has_many :product_offers, :dependent => :destroy
  has_many :offers, :through => :product_offers
  has_and_belongs_to_many :consumables

end

