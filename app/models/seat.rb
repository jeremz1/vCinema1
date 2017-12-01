class Seat < ActiveRecord::Base
  belongs_to :screen
  has_many :seat_reservations

end
