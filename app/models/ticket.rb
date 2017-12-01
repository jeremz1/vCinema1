class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  belongs_to :showing
  belongs_to :screen

  
  def validate

  
    #errors.add("screen", "not in use for this showing.") unless showing.screens.include?(screen)

    
#    a = booking.showing.tickets.collect {|t| t if t.ticket_type_id == ticket_type_id }
#
#    numOfTypeForShowing = a.compact.length
#    
#    a = booking.showing.ticket_type_allocations.collect {|tta| tta if tta.ticket_type_id == ticket_type_id}
#    
#    numAvailableForShowing = 0
#    a.compact!
#    numAvailableForShowing = a[0].max_number unless a.length == 0
#
#    errors.add("ticket_type", "maximum ticket allocation exceeded.") unless numAvailableForShowing == -1 or numOfTypeForShowing < numAvailableForShowing

  end
 
  
  def sale
    return TicketSale.find_by_ticket_id(self.id).sale
  end
  
  def price
    self.ticket_type.price
  end
end
