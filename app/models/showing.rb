class Showing < ActiveRecord::Base
  belongs_to :film
  has_and_belongs_to_many :screens
  #has_many :bookings
  has_many :ticket_type_allocations, :dependent => :destroy
  has_many :ticket_types, :through => :ticket_type_allocations
  has_many :seat_reservations
  has_many :tickets


  def total_seats_allocated
    totalSeats = 0
    screens.each {|s| totalSeats += s.seat_count }
    return totalSeats
  end
  
  def temp_tickets
    tts = Array.new
    for tta in ticket_type_allocations
      TempTicket.find_all_by_ticket_type_allocation_id(tta.id).each {|tt| tts << tt}
    end
    tts
  end
  
  #def tickets
  #  Ticket.find_all_by_showing_id(self.id)
  ##  ts = Array.new
  ##  for booking in self.bookings
  ##    booking.tickets.each {|t| ts << t}
  ##  end
  ##  return ts
  #end
  
  def ticket_types=(tts)
    for tt in TicketTypeAllocation.find(:all, :conditions => "showing_id = #{self.id}")
      TicketTypeAllocation.delete(tt.id)
    end
    for tt in tts
      tta = TicketTypeAllocation.new
      tta.ticket_type = tt
      tta.showing = self
      tta.save
    end
  end
  
  def available_ticket_types
    self.ticket_types
  end
  
#  def booked_num_of_type(tt, unsaved_booking)
#    c = 0
#    for b in bookings
#      for t in b.tickets
#        c += 1 if t.ticket_type.id == tt.id
#      end
#    end
#    if unsaved_booking.tickets != nil
#      for t in unsaved_booking.tickets
#        c += 1 if t.ticket_type.id == tt.id
#      end
#    end
#    c
#  end
  
#  def allocated_ticket_types
#    tts = Array.new
#    for tta in ticket_type_allocations
#      tts << tta.ticket_type #if tta.max_number == -1 or tta.max_number > booked_num_of_type(tta.ticket_type))
#    end
#    tts
#  end

  def clashes_with(showing)
    this_start = self.show_time
    this_end = self.show_time.in(self.film.length * 60)
    
    that_start = showing.show_time
    that_end = showing.show_time.in(showing.film.length * 60)
    
    
    ((not ((this_end < that_start) or (this_start > that_end))) and (self.screens & showing.screens).size > 0 )
  end
  
  def can_delete
    (tickets.size == 0)
  end
end
