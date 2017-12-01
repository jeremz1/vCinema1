class PaymentMethod < ActiveRecord::Base
  has_many :bookings
end
