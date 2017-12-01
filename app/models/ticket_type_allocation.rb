class TicketTypeAllocation < ActiveRecord::Base
  belongs_to :showing
  belongs_to :ticket_type
  has_many :temp_tickets
  
  def tickets
    (showing.tickets.collect {|t| t if t.ticket_type_id == self.ticket_type_id}).compact
  end
end
