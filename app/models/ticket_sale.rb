class TicketSale < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :sale
end
