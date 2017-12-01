class RefreshmentSale < ActiveRecord::Base
  belongs_to :refreshment
  belongs_to :sale
end
