class BookingsController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
 
def list
  @page_heading = "Ticket Collection"
  @bookings = Booking.find_all_by_collected(false)
end

def mark_collected
  b = Booking.find(params[:id])
  b.collected = true
  b.save
  redirect_to :action => "list"
end
end
