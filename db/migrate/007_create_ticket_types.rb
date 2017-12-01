class CreateTicketTypes < ActiveRecord::Migration
  def self.up
    
    TicketType.new(:name => "Full", :price => 5.25).save
    TicketType.new(:name => "Concession", :price => 5.25).save
    
    
    TicketType.new(:name => "Royal Full", :price => 4.75).save
    TicketType.new(:name => "Royal Concession", :price => 3.75).save
    
    TicketType.new(:name => "Orange Wednesday Free Ticket", :price => 0).save
    
    TicketType.new(:name => "Tea Matinee Full", :price => 3.65).save
    TicketType.new(:name => "Tea Matinee Concession", :price => 2.78).save

    TicketType.new(:name => "Royal Tea Matinee Full", :price => 3.15).save
    TicketType.new(:name => "Royal Tea Matinee Concession", :price => 2.28).save

  end

  def self.down

  end
end
