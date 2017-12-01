class Sale < ActiveRecord::Base
  has_many :ticket_sales
  has_many :refreshment_sales
  has_many :other_product_sales
  has_many :offer_sales
  has_many :tickets, :through => :ticket_sales
  has_many :refreshments, :through => :refreshment_sales
  has_many :products, :through => :other_product_sales
  has_many :offers, :through => :offer_sales

  belongs_to :payment_method
  has_many :seat_reservations
  belongs_to :user
  
def initialize
  super()
  self.temp_seat_reservations = Array.new
  self.temp_tickets = Array.new
end

def temp_tickets=(tts)
  @temp_tickets = tts
end

def temp_tickets
  @temp_tickets
end

def temp_seat_reservations=(tsrs)
  @temp_seat_reservations = tsrs
end

def temp_seat_reservations
  @temp_seat_reservations
end

def total_price
  tp = 0
  for t in ticket_sales
    tp += t.price
  end
  for r in refreshment_sales
    tp += r.price
  end
  for p in other_product_sales
    tp += p.price
  end
  for o in offer_sales
    tp -= o.refund_amount
  end
  tp += card_surcharge
  tp += cheque_surcharge
  tp
end

end