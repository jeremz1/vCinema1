class Consumable < ActiveRecord::Base
  has_and_belongs_to_many :products
  
def use_one
  self.stock_level -= 1
  self.save
end
end
