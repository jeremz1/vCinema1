class Booking < Sale
  belongs_to :customer
  belongs_to :booking_source
end
