class CreateTicketTypeAllocations < ActiveRecord::Migration
  def self.up
    create_table :ticket_type_allocations do |t|
      t.column :ticket_type_id, :integer, :null => false
      t.column :showing_id, :integer, :null => false
      t.column :max_number, :integer, :default => -1
    end
    
    execute 'ALTER TABLE ticket_type_allocations ADD CONSTRAINT fk_priceband_showing FOREIGN KEY ( ticket_type_id ) REFERENCES products( id ) '
    execute 'ALTER TABLE ticket_type_allocations ADD CONSTRAINT fk_showing_priceband FOREIGN KEY ( showing_id ) REFERENCES showings( id ) '
    

    #s = Showing.find(:all)
    #s.each do |sh| 
    #    sh.ticket_types = TicketType.find(:all)
    #    sh.save
    #  end
  end

  def self.down
    drop_table :ticket_type_allocations
  end
end
