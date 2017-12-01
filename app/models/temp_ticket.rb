class TempTicket < ActiveRecord::Base
  belongs_to :ticket_type_allocation
  
  
  def validate
  
    TempTicket.clear_old_temp_tickets()
    
    
    
    numTicketsForShowing = 0
    
    for t in ticket_type_allocation.showing.tickets
      numTicketsForShowing += 1 if not t.sale.refunded
    end
  
    numTempTicketsForShowing = ticket_type_allocation.showing.temp_tickets.length
    
    totalShowingTicketsTaken = numTicketsForShowing + numTempTicketsForShowing
    
    #puts "SEATS: " + ticket_type_allocation.showing.total_seats_allocated.to_s
    if totalShowingTicketsTaken >= ticket_type_allocation.showing.total_seats_allocated
      errors.add_to_base("No tickets left for showing on #{ticket_type_allocation.showing.show_time.to_s}.")

    end
    
    ticketsOfTypeTaken = ticket_type_allocation.tickets.length + ticket_type_allocation.temp_tickets.length
    
    if ticket_type_allocation.max_number > -1 and ticketsOfTypeTaken >= ticket_type_allocation.max_number
      errors.add_to_base("Maximum ticket allocation exceeded for '#{ticket_type_allocation.ticket_type.name}'.") 

    end
  
  end
  
  def self.clear_old_temp_tickets()
    tts = TempTicket.find(:all, :conditions => {"time_reserved" => 10.years.ago..5.minutes.ago})
    for tt in tts
      TempTicket.delete(tt.id)
    end
	
    srs = SeatReservation.find(:all, :conditions => {"sale_id" => nil, "time_reserved" => 10.years.ago..5.minutes.ago})
    for sr in srs
      SeatReservation.delete(sr.id)
    end
  end
end
