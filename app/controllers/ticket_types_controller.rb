class TicketTypesController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
  def list
    @page_heading = "Ticket Types"
  end
  
  def edit
    @ticket_type = TicketType.find(params[:id])
    @page_heading = "Ticket Types :: Edit \"#{@ticket_type.name}\" ticket"
  end
  
  def update
    
    TicketType.find(params[:id]).update_attributes(params[:ticket_type])
    flash[:notice] = "Successfully updated \"#{params[:ticket_type][:name]}\" ticket type."
    
    redirect_to :action => :list
  end
  
  def delete
     tt = TicketType.find(params[:id])
     if tt.tickets.size == 0 and tt.product_offers.size == 0
       tt.ticket_type_allocations.clear
       tt.save
       TicketType.delete(tt.id)
       flash[:notice] = "Successfully deleted ticket type."
     else 
       flash[:notice] = "Failed to delete ticket type."       
     end
     
     redirect_to :action => :list
   end
   
   def new
     redirect_to :action => :edit, :id => TicketType.create(:name => "New", :price => 3.00).id
   end
end
