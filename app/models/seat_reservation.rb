class SeatReservation < ActiveRecord::Base
  belongs_to :seat
  belongs_to :showing
  belongs_to :sale
  
  def validate
    
    sr = SeatReservation.find_by_seat_id_and_showing_id(self.seat.id, self.showing.id)
    
    if sr != nil and sr.id != self.id
      errors.add_to_base("The seats you chose are unavailable.")
    end

  end
end
