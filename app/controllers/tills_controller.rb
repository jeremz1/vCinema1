class TillsController < ApplicationController
  before_filter :check_authenticated, :except => [:login, :enter_pin, :new_pin]
  layout "main", :except => [:print_labels, :print_receipt, :print_booking_slip, :print_cash_up, :print_refund, :print_blank]
  
def login
  
  if request.post?
    u = User.authenticate(params[:user][:username], params[:user][:pin])
    if u != nil
      if u.hashed_pin == Digest::SHA1.hexdigest("0000")
        session[:user] = u
        redirect_to :action => :new_pin
        return
      end
      
      reset_session
      if u.saved_session != nil
        session[:user_data] = YAML::load(u.saved_session) 
        u.saved_session = nil
        u.save
      end
      session[:user] = u
      u.last_login = Time.now
      u.save
      redirect_to :action => :choose_mode          
    end  
    @user = User.new
    @user.username = params[:user][:username]
  else
    @user = User.new
    @user.username = "username"
  end

end

def enter_pin
  @user = User.find(params[:id])
  
  render :update do |page|
    page.replace_html "login", render(:partial => "enter_pin")
  end
end

def new_pin
  if request.post?
    if session[:new_pin] == nil
      session[:new_pin] = params[:user][:pin]
    else
      if params[:user][:pin] == session[:new_pin]
        session[:user].pin = session[:new_pin]

        
        reset_session
        if session[:user].saved_session != nil
          session[:user_data] = YAML::load(session[:user].saved_session) 
          session[:user].saved_session = nil
          session[:user].save
        end

        session[:user].last_login = Time.now
        session[:user].save
        redirect_to :action => :choose_mode          
      else
        session[:new_pin] = nil
      end
    end
  else
    session[:new_pin] = nil
  end
end

def logout
  session[:user].saved_session = session[:user_data].to_yaml
  session[:user].save
  session[:user] = nil
  redirect_to :action => :login
end

def switch_user
  session[:user].saved_session = session[:user_data].to_yaml
  session[:user].save
  session[:user] = nil

  u = User.find_by_id(params[:id].to_i)
  if (u.last_login <=> 10.minutes.ago) == 1 then
    session[:user] = u
  end

    if session[:user_data] != nil and session[:user_data][:sale] != nil
      if session[:user_data][:sale][:temp_seat_reservations] != nil
        session[:user_data][:sale][:temp_seat_reservations].clear
      end
    end

  reset_session  
  
  if session[:user] != nil
    session[:user].last_login = Time.now
    session[:user].save
    
    if session[:user].saved_session != nil
      session[:user_data] = YAML::load(session[:user].saved_session) 

      session[:user].saved_session = nil
      session[:user].save
    end
  end

  
  redirect_to :action => :home
end

def choose_mode
  
end

def clock_in
  session[:user].clock_in
  render :nothing => true
end

def clock_out
  session[:user].clock_out
  render :nothing => true
end

def cash_up
  @this_ip = params[:remote_addr]
  cash_ups = CashUp.find(:all, :conditions => {:till_ip => @this_ip})
  
  if cash_ups.size > 0
    cash_ups.sort! {|a,b| b.time <=> a.time}
    @last_cash_up_time = cash_ups[0].time
  else
    @last_cash_up_time = 1.year.ago
  end
  
  
  sales_since = Sale.find(:all, :conditions => {:sale_time => @last_cash_up_time..Time.now, :till_ip => @this_ip})
  
  @cash_amount = 50
  @card_amount = 0
  @cheque_amount = 0
 
  if sales_since != nil
    @cash_sales_since = (sales_since.collect {|s| (s.payment_method.name == "Cash" ? s : nil)}).compact
    @card_sales_since = (sales_since.collect {|s| (s.payment_method.name == "Card" ? s : nil)}).compact
    @cheque_sales_since = (sales_since.collect {|s| (s.payment_method.name == "Cheque" ? s : nil)}).compact
    
    @cash_sales_since = Array.new if @cash_sales_since.nil?
    @card_sales_since = Array.new if @card_sales_since.nil?
    @cheque_sales_since = Array.new if @cheque_sales_since.nil?
    
    @cash_sales_since.each {|s| @cash_amount += s.total_price}
    @card_sales_since.each {|s| @card_amount += s.total_price}
    @cheque_sales_since.each {|s| @cheque_amount += s.total_price}
  end
  
  new_cash_up = CashUp.new(:user_id => session[:user].id, :time => Time.now, :till_ip => @this_ip, :cash_amount => @cash_amount, :card_amount => @card_amount, :cheque_amount => @cheque_amount)
  session[:new_cash_up] = new_cash_up



  #t.advance(:days => 3).beginning_of_week.advance(:days => -3)


end

def print_cash_up
  session[:new_cash_up].save
  @cash_up = session[:new_cash_up]
end

def home
  #@page_heading = "Home"
  #reset_session
  #session[:user_data][:sale_step] = 0
  session[:user].clock_in if not session[:user].is_clocked_in
  @secondary_mode = "till"

  render(:partial => "content", :layout => "main")
end

def select_tickets_button
  render :update do |page|
    @films = Film.find_all_bookable_films
    @buttons = Array.new
    for f in @films
      @buttons << {:id => f.id, :caption => f.title, :submit_url => "select_film"}
    end
    @buttons_heading = "Select Film"
    page.replace_html "mid_pane", render(:partial => "shared/button_grid")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_film_list")
    page.replace_html "secondary_ads", render(:partial => "secondary_ads", :locals => {:page => "select_tickets"})
  end
end

def select_film
  @film = Film.find(params[:id])
  @showings = @film.find_all_bookable_showings
  @showings.sort! {|a,b| a.show_time <=> b.show_time}
  render :update do |page|
    page.replace_html "mid_pane", render(:partial => "select_showing")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_showing_list")
  end
end

def select_showing
  s = Showing.find(params[:id])
  session[:user_data][:selected_showing] = s.id
  @ticket_types = s.available_ticket_types
  
  @buttons = Array.new
  for tt in @ticket_types
    @buttons << {:id => tt.id, :caption => tt.name, :submit_url => "select_ticket"}
  end
  
  numTicketsForShowing = 0
    
  for t in s.tickets
    numTicketsForShowing += 1 if not t.sale.refunded
  end

  numTempTicketsForShowing = s.temp_tickets.length
  
  totalShowingTicketsTaken = numTicketsForShowing + numTempTicketsForShowing
  
  seats_available = s.total_seats_allocated - totalShowingTicketsTaken
  @buttons_heading = "Select Tickets (#{seats_available} available, #{totalShowingTicketsTaken} sold)"
 
  render :update do |page|
    page.replace_html "mid_pane", render(:partial => "shared/button_grid")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_ticket_list")
  end
end

def select_ticket
  #t = Ticket.new
  #t.showing = Showing.find(session[:user_data][:selected_showing])
  #t.ticket_type = TicketType.find(params[:id])
  session[:user_data][:selected_products][:tickets] << [session[:user_data][:selected_showing], params[:id].to_i]
  


  add_automatic_offers
  


  #@selected_ticket_types = session[:user_data][:selected_products][:ticket_types]
  render :update do |page|
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
  end
end

def select_drinks_button
  @ads_page = "select_drinks"
  render_refreshment_selection_screen("Soft Drink")
end

def select_alcohol_button
  @ads_page = "select_alcohol"
  render_refreshment_selection_screen("Alcohol")
end

def select_snacks_button
  @ads_page = "select_snacks"
  render_refreshment_selection_screen("Snack")
end

def select_sweets_button
  @ads_page = "select_sweets"
  render_refreshment_selection_screen("Sweet")
end

def select_ices_button
  @ads_page = "select_ices"
  render_refreshment_selection_screen("Ice")
end

def select_other_button
  @buttons = Array.new
  
  rs = Product.find(:all, :conditions => {:type => nil}).collect {|p| (p.available ? p : nil)}.compact
  rs.sort! {|a,b| a.name <=> b.name}
  for r in rs
    @buttons << {:id => r.id, :caption => r.name + "<br>" + r.price.as_price, :submit_url => :select_other_product}
  end

  render :update do |page|
    page.replace_html "mid_pane", render(:partial => "shared/button_grid")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_other_products_list")
    page.replace_html "secondary_ads", render(:partial => "secondary_ads", :locals => {:page => "select_other_products"})
  end
end

def render_refreshment_selection_screen(refreshment_type)
  @buttons = Array.new
  
  rs = Refreshment.find_all_by_refreshment_type_id_and_available(RefreshmentType.find_by_name(refreshment_type).id, true)
  rs.sort! {|a,b| a.name <=> b.name}
  for r in rs
    @buttons << {:id => r.id, :caption => r.name + "<br>" + r.price.as_price, :submit_url => :select_refreshment}
  end


  render :update do |page|
    page.replace_html "mid_pane", render(:partial => "shared/button_grid")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_refreshment_list", :locals => {:refreshment_type => refreshment_type})
    page.replace_html "secondary_ads", render(:partial => "secondary_ads", :locals => {:page => @ads_page})
  end
end

def select_refreshment


  session[:user_data][:selected_products][:refreshments] << params[:id].to_i
  
  add_automatic_offers
    
  render :update do |page|
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
  end
end

def select_other_product
  session[:user_data][:selected_products][:other] << params[:id].to_i
  
  add_automatic_offers
  
  render :update do |page|
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
  end
end

def barcode_input
  
  p = Product.find_by_barcode(params[:input])
  if p != nil
    case p.class.to_s
    when "Refreshment"
      params[:id] = p.id
      select_refreshment
      return
    when "Product"
      params[:id] = p.id
      select_other_product
      return
    end   
  end

  render :nothing => true
end

def delete_cart_item
  
  case params[:type]
    when "Ticket"

      for i in 0..(session[:user_data][:selected_products][:tickets].size - 1)
        if session[:user_data][:selected_products][:tickets][i][0].to_i == params[:showing_id].to_i and session[:user_data][:selected_products][:tickets][i][1].to_i == params[:ticket_type_id].to_i 
          session[:user_data][:selected_products][:tickets][i] = nil
          break
        end
      end
  
      session[:user_data][:selected_products][:tickets].compact!
      validate_offers
      add_automatic_offers
      
    when "Refreshment" 

      for i in 0..(session[:user_data][:selected_products][:refreshments].size - 1)
        if session[:user_data][:selected_products][:refreshments][i].to_i == params[:refreshment_id].to_i
          session[:user_data][:selected_products][:refreshments][i] = nil
          break
        end
      end
      
      session[:user_data][:selected_products][:refreshments].compact!
      validate_offers
      add_automatic_offers
      
    when "Other"
  
      for i in 0..(session[:user_data][:selected_products][:other].size - 1)
        if session[:user_data][:selected_products][:other][i].to_i == params[:other_id].to_i
          session[:user_data][:selected_products][:other][i] = nil
          break
        end
      end
      
      session[:user_data][:selected_products][:other].compact!
      validate_offers
      add_automatic_offers

    
    when "Offer"

      for i in 0..(session[:user_data][:selected_products][:offers].size - 1)
        if session[:user_data][:selected_products][:offers][i].to_i == params[:offer_id].to_i
          session[:user_data][:selected_products][:offers][i] = nil
          break
        end
      end
      session[:user_data][:selected_products][:offers].compact!
      
    end  
    
  render :update do |page|
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
  end
end

def duplicate_cart_item
  case params[:type]
    when "Ticket"
      session[:user_data][:selected_products][:tickets] << [params[:showing_id].to_i, params[:ticket_type_id].to_i]
      add_automatic_offers
    when "Refreshment"
      session[:user_data][:selected_products][:refreshments] << params[:refreshment_id].to_i
      add_automatic_offers
    when "Other"
      session[:user_data][:selected_products][:other] << params[:other_id].to_i
      add_automatic_offers
    when "Offer"
      session[:user_data][:selected_products][:offers] << params[:offer_id].to_i
      validate_offers
  end
    
  render :update do |page|
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
  end    
  
end
def validate_offers #Remove any offers whose products do not exist
  

  products = get_products_array
  
  for i in 0..(session[:user_data][:selected_products][:offers].length - 1)
    if session[:user_data][:selected_products][:offers][i] != nil
      this_offer = Offer.find(session[:user_data][:selected_products][:offers][i])

      found_all = true
      for p in this_offer.products
        found = false
        for j in 0..(products.length)
          if not found and products[j] != nil then
            if products[j].id == p.id then
              products[j] = nil
              found = true
            end
          end
        end
        found_all = (found_all and found)
      end
      
      if not found_all then
        session[:user_data][:selected_products][:offers][i] = nil
        validate_offers
        session[:user_data][:selected_products][:offers].compact!
        return
      end
        
    end
  end
  session[:user_data][:selected_products][:offers].compact!
end

def add_automatic_offers
  os = Offer.find_applicable(get_products_array, true, session[:user_data][:selected_products][:offers])
  os.each {|o| session[:user_data][:selected_products][:offers] << o.id}
end

def get_products_array
  products = session[:user_data][:selected_products][:refreshments].collect {|rid| Refreshment.find(rid)}
  session[:user_data][:selected_products][:tickets].each {|t| products << TicketType.find(t[1]) }
  return products
end

def cancel_sale
  reset_session
  
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end


def select_offers_button
  @buttons = Array.new 
  for o in Offer.find_applicable(get_products_array, false, session[:user_data][:selected_products][:offers])
    @buttons << {:id => o.id, :caption => o.name + "<br>" + (-o.refund_amount).as_price, :submit_url => :select_offer}
  end

  render :update do |page|
    page.replace_html "mid_pane", render(:partial => "shared/button_grid")
    page.replace_html "right_pane", render(:partial => "cart")
    page.replace_html "secondary_cart", render(:partial => "secondary_cart")
    page.replace_html "secondary_dynamic", render(:partial => "secondary_offers_list")
    page.replace_html "secondary_ads", render(:partial => "secondary_ads", :locals => {:page => "select_offers"})
  end
end

def select_offer
  session[:user_data][:selected_products][:offers] << params[:id].to_i
  validate_offers
  select_offers_button
end

def confirm_products

  
  if session[:user_data][:sale][:temp_tickets] != nil
    for tt in session[:user_data][:sale][:temp_tickets].collect {|ttid| TempTicket.find(ttid)}
      TempTicket.delete(tt)
    end
  end
  
  #Create temp tickets.
  session[:user_data][:sale] = Hash.new
  session[:user_data][:sale][:temp_tickets] = Array.new
  for t in session[:user_data][:selected_products][:tickets]
    tt = TempTicket.new
    tt.ticket_type_allocation = TicketTypeAllocation.find_by_showing_id_and_ticket_type_id(t[0], t[1])
    tt.time_reserved = Time.now
    if tt.save then
      session[:user_data][:sale][:temp_tickets] << tt.id
    else
      @errors = tt.errors.full_messages
      session[:user_data][:sale][:temp_tickets].each { |tt| TempTicket.delete(tt) }
      render :update do |page|
        page.replace_html "mid_pane", render(:partial => "temp_ticket_fail")
      end
      return
    end
  end
  
  session[:user_data][:showings] = Array.new
  for t in session[:user_data][:selected_products][:tickets]
    session[:user_data][:showings] << t[0]
  end

  session[:user_data][:showings] = session[:user_data][:showings].uniq


  #Now know that there are sufficient seats available. Go to seat reservation screen.
  #Or, if no tickets, go straight to payment screen.
  if session[:user_data][:selected_products][:tickets].length > 0
    session[:user_data][:sale_step] = 1
  else
    session[:user_data][:is_booking] = false
    session[:user_data][:sale_step] = 7
  end
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def unreserved_seats
  #Don't reserve any seats. Go straight to step 3
  session[:user_data][:reserved_seats] = false
  clear_temp_seat_reservations()
  #session[:user_data][:sale_step] = 3
  
  session[:user_data][:is_booking] = false
  session[:user_data][:sale_step] = 7

  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_seats
  #Choose seats for each ticket, then go to step 3.
  session[:user_data][:reserved_seats] = true
  session[:user_data][:sale_step] = 2
  params[:id] = session[:user_data][:selected_products][:tickets][0][0]
  select_showing_button()

end

def select_showing_button

  #session[:user_data][:showing_reservation_strings] = Hash.new if session[:user_data][:showing_reservation_strings] == nil
  session[:user_data][:showing_reservation_strings][session[:user_data][:showing_id]] = params[:selected_seats] unless params[:selected_seats] == nil or session[:user_data][:showing_id] == nil
  
  session[:user_data][:showing_id] = params[:id].to_i
  session[:user_data][:ticket_count] = 0

  for t in session[:user_data][:selected_products][:tickets]
    if t[0] == session[:user_data][:showing_id] then
      session[:user_data][:ticket_count] += 1
    end
  end

  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def finish_seat_reservation  
  session[:user_data][:showing_reservation_strings] = Hash.new if session[:user_data][:showing_reservation_strings] == nil
  session[:user_data][:showing_reservation_strings][session[:user_data][:showing_id]] = params[:selected_seats] unless params[:selected_seats] == nil or session[:user_data][:showing_id] == nil
  #TODO: Clear expired seat reservations somewhere.
  #Create Seat Reservations here
  
  session[:user_data][:sale][:temp_seat_reservations] = Array.new
  for showing in session[:user_data][:showing_reservation_strings].keys
    for seat in session[:user_data][:showing_reservation_strings][showing].split('|')
      sr = SeatReservation.new()
      sr.seat = Seat.find_by_id(seat.to_i)
      sr.showing = Showing.find_by_id(showing.to_i)
      sr.time_reserved = Time.now
      
      if sr.save then
        session[:user_data][:sale][:temp_seat_reservations] << sr.id
      else
        session[:user_data][:showing_reservation_strings] = Hash.new
        @errors = sr.errors.full_messages
        session[:user_data][:sale][:temp_seat_reservations].each { |sr| SeatReservation.delete(sr) }
        session[:user_data][:sale_step] = 0
        render :update do |page|
          page.replace_html "content_pane", render(:partial => "content")
          page.replace_html "mid_pane", render(:partial => "seat_reservation_fail")
          @secondary_mode = "till"
          page.replace_html "secondary_content", render(:partial => "secondary_content")
        end
       return
      end

      
      
    end
  end
  
  
  
  #session[:user_data][:sale_step] = 3
  
  session[:user_data][:is_booking] = true
  session[:user_data][:sale_step] = 4

  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_booking
  session[:user_data][:is_booking] = true
  session[:user_data][:sale_step] = 4
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_new_customer
  session[:user_data][:sale_step] = 5
  session[:user_data][:new_customer] = true
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_existing_customer
  session[:user_data][:sale_step] = 6
  session[:user_data][:new_customer] = false
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def confirm_new_customer
  session[:user_data][:new_customer_details] = params[:customer]
  session[:user_data][:sale_step] = 7
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def customer_search
  @buttons = Array.new
  
  customers = Array.new
  if params[:customer_name].length > 0
	if params[:customer_telephone].length > 0
	  # We have both params
	  customers = Customer.find(:all, :conditions => "name LIKE '#{params[:customer_name]}%' and telephone LIKE '%#{params[:customer_telephone]}%'")
	else
	  # We just have customer name
	  customers = Customer.find(:all, :conditions => "name LIKE '#{params[:customer_name]}%'")
	end
  else
    if params[:customer_telephone].length > 0
	  # We just have customer tel
	  customers = Customer.find(:all, :conditions => "telephone LIKE '%#{params[:customer_telephone]}%'")
	else
	  # We don't have anything. Why are we here?!
	end
  end
  
  for c in customers
	@buttons << {:caption => c.name + " (" + c.telephone + ")", :id => c.id, :submit_url => "confirm_existing_customer"}      
  end
  @max_buttons = 15
  @buttons_top_offset=200
  render :update do |page|
    if @buttons.size > 0 
      page.replace_html "search_results", render(:partial => "shared/button_grid")
    else
      page.replace_html "search_results", render(:partial => "no_customers")
    end
  end
end

def confirm_existing_customer
  session[:user_data][:customer_id] = params[:id].to_i
  session[:user_data][:sale_step] = 7
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_immediate
  #Don't need customer details. Go straight to step 7
  session[:user_data][:is_booking] = false
  session[:user_data][:sale_step] = 7
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def select_payment_method
  session[:user_data][:sale][:payment_method] = params[:id]
  
  
  session[:user_data][:sale_step] = 8
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def print_receipt
  @sale = Sale.find_by_id(session[:user_data][:new_sale_id])
end

def confirm_payment_taken

  if session[:user_data][:is_booking] == false
    #this_sale = session[:user_data][:sale]
    this_sale = Sale.new
    this_sale.temp_tickets = session[:user_data][:sale][:temp_tickets]
    this_sale.temp_seat_reservations = session[:user_data][:sale][:temp_seat_reservations]
    this_sale.collected = true
  else
    this_sale = Booking.new()
    this_sale.collected = false
    this_sale.temp_tickets = session[:user_data][:sale][:temp_tickets]
    this_sale.temp_seat_reservations = session[:user_data][:sale][:temp_seat_reservations]
    if session[:user_data][:new_customer]
      c = Customer.new(session[:user_data][:new_customer_details])
      c.save
      this_sale.customer = c
    else
      this_sale.customer = Customer.find_by_id(session[:user_data][:customer_id])
    end
  end
  

  this_sale.payment_method = PaymentMethod.find(session[:user_data][:sale][:payment_method])
  this_sale.tendered = params[:tendered].to_f
  this_sale.sale_time = Time.now
  this_sale.till_ip = params[:remote_addr]
  this_sale.user = session[:user]
  this_sale.save
  
  
  # Confirm seat reservations.
  
  if this_sale.temp_seat_reservations != nil
    for sr in this_sale.temp_seat_reservations
      res = SeatReservation.find_by_id(sr)
      res.sale = this_sale
      res.save
    end
    this_sale.temp_seat_reservations.clear
  end

  
  # Create tickets and delete temp tickets 
  created_tickets = Array.new
  for tt in this_sale.temp_tickets.collect {|ttid| TempTicket.find(ttid)}
    t = Ticket.new
    t.showing = tt.ticket_type_allocation.showing
    t.ticket_type = tt.ticket_type_allocation.ticket_type

    t.save
    created_tickets << t.id
    TempTicket.delete(tt.id)
    
    ts = TicketSale.new
    ts.sale = this_sale
    ts.ticket = t
    ts.price = t.ticket_type.price
    t.ticket_type.consumables.each {|c| c.use_one }
    ts.save
  end

  # Create refreshment sales
  
  for r in session[:user_data][:selected_products][:refreshments].collect {|rid| Refreshment.find(rid)}
    rs = RefreshmentSale.new
    rs.refreshment = r
    rs.sale = this_sale
    rs.price = r.price
    rs.save
    r.consumables.each {|c| c.use_one }
    r.stock_level -= 1
    r.save
  end
  
  # Create other product sales

  for p in session[:user_data][:selected_products][:other].collect {|pid| Product.find(pid)}
    ps = OtherProductSale.new
    ps.product = p
    ps.sale = this_sale
    ps.price = p.price
    ps.save
  end
  
  # Create offer sales

  for o in session[:user_data][:selected_products][:offers].collect {|oid| Offer.find(oid)}
    os = OfferSale.new
    os.offer = o
    os.sale = this_sale
    os.refund_amount = o.refund_amount
    os.save
  end

  if this_sale.payment_method.name == "Card" and Preference.get("card_surcharge").to_f > 0 and this_sale.total_price < Preference.get("card_surcharge_limit").to_f
    this_sale.card_surcharge = Preference.get("card_surcharge").to_f
    this_sale.save
  end
  if this_sale.payment_method.name == "Cheque" and Preference.get("cheque_surcharge").to_f > 0 and this_sale.total_price < Preference.get("cheque_surcharge_limit").to_f
    this_sale.cheque_surcharge = Preference.get("cheque_surcharge").to_f
    this_sale.save
  end

  session[:user_data][:new_sale_id] = this_sale.id
  session[:user_data][:sale_step] = 9
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def sale_finished
  reset_session
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
end

def reset_session
  clear_temp_seat_reservations()
  if session[:user_data] != nil then
    if session[:user_data][:sale] != nil then
      if session[:user_data][:sale][:temp_tickets] != nil then 
        session[:user_data][:sale][:temp_tickets].each { |tt| TempTicket.delete(tt) }
      end
    end
  end
  session[:user_data] = Hash.new

  session[:user_data][:selected_products] = Hash.new
  session[:user_data][:selected_products][:tickets] = Array.new
  session[:user_data][:selected_products][:refreshments] = Array.new
  session[:user_data][:selected_products][:other] = Array.new
  session[:user_data][:selected_products][:offers] = Array.new
  session[:user_data][:showing_reservation_strings] = Hash.new
  session[:user_data][:customer_id] = nil
  session[:user_data][:new_customer_details] = Hash.new
  session[:user_data][:sale_step] = 0
  session[:user_data][:sale] = Hash.new
end


def back_button
  case session[:user_data][:sale_step]
    when 1
      session[:user_data][:sale_step] = 0
    when 2
      session[:user_data][:sale_step] = 1
    when 3 #Never get here anymore
      if session[:user_data][:reserved_seats] then
        clear_temp_seat_reservations()
        session[:user_data][:sale_step] = 2
      else
        session[:user_data][:sale_step] = 1
      end
    when 4
      clear_temp_seat_reservations()
      session[:user_data][:sale_step] = 2#3
    when 5
      session[:user_data][:sale_step] = 4
    when 6
      session[:user_data][:sale_step] = 4
    when 7
      if session[:user_data][:is_booking]
        if session[:user_data][:new_customer]
          session[:user_data][:sale_step] = 5
        else
          session[:user_data][:sale_step] = 6
        end
      else
        if session[:user_data][:selected_products][:tickets].length > 0
          session[:user_data][:sale_step] = 1#3
        else
          session[:user_data][:sale_step] = 0
        end        
      end
    when 8
      session[:user_data][:sale_step] = 7
  end
  
  render :update do |page|
    page.replace_html "content_pane", render(:partial => "content")
    @secondary_mode = "till"
    page.replace_html "secondary_content", render(:partial => "secondary_content")
  end
  
end

def clear_temp_seat_reservations
    if session[:user_data] != nil and session[:user_data][:sale] != nil
      if session[:user_data][:sale][:temp_seat_reservations] != nil
        for tsr in session[:user_data][:sale][:temp_seat_reservations]
          SeatReservation.delete(tsr)
        end
      end
    end
  end
  
def print_booking_slip
  @sale = Sale.find_by_id(session[:user_data][:new_sale_id])
end

def ticket_collection

end

def confirm_ticket_collection
  @sale = Sale.find_by_id(params[:ticket][:num])
  if @sale == nil
    redirect_to :action => :ticket_collection
  end
end

def set_ticket_collected
  s = Sale.find(params[:id])
  s.collected = true
  s.save
  redirect_to :action => :ticket_collection
end

def confirm_refund
  @sale = Sale.find_by_id(params[:ticket][:num])
  if @sale == nil
    redirect_to :action => :refund
  end
end

def print_refund
  @sale = Sale.find(params[:id])
  @sale.refunded = true
  srs = Array.new(@sale.seat_reservations)
  @sale.seat_reservations.clear
  @sale.save
  srs.each {|sr| SeatReservation.delete(sr.id)}
  #redirect_to :action => :ticket_collection

end

def choose_labels_showing
  @showings = Showing.find(:all, :conditions => {:show_time => Time.now..1.week.from_now})
  @showings.sort! {|a,b| a.show_time <=> b.show_time}
end

def print_labels
  @seat_reservations = Showing.find(params[:id]).seat_reservations.collect {|sr| (sr.sale_id != nil and sr.sale.class.to_s == "Booking" ? sr : nil)}.compact
  @seat_reservations.sort! {|a,b| a.seat_id <=> b.seat_id}
end

def print_blank

end
  
end
