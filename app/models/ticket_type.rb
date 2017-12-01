class TicketType < Product
  has_many :tickets
  has_many :ticket_type_allocations, :dependent => :destroy
  has_many :showings, :through => :ticket_type_allocations

  
end