class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.column :showing_id, :integer
      t.column :ticket_type_id, :integer
    end
    

    execute 'ALTER TABLE tickets ADD CONSTRAINT fk_ticket_ticket_type FOREIGN KEY ( ticket_type_id ) REFERENCES products( id ) '    
    execute 'ALTER TABLE tickets ADD CONSTRAINT fk_ticket_showing FOREIGN KEY ( showing_id ) REFERENCES showings( id ) '    


    

    #t = Ticket.new
    #t.showing = Showing.find(1)
    #t.ticket_type = TicketType.find(1)
    #t.save    
 
    #t = Ticket.new
    #t.showing = Showing.find(1)
    #t.ticket_type = TicketType.find(2)
    #t.save
    

    #t = Ticket.new
    #t.showing = Showing.find(1)
    #t.ticket_type = TicketType.find(1)
    #t.save

  end

  def self.down
    drop_table :tickets
  end
end
