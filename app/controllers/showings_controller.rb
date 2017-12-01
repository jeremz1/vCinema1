class ShowingsController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  #scaffold :showing
  
  def list
    @page_heading = "Showings"
  end
  
  def list_by_film
    @page_heading = "Showings by film"
    if params[:id] == nil
      params[:id] = 1
    end
   
    @film = Film.find(params[:id])
  end
  
  def list_by_date
    @page_heading = "Showings by date"    
    if params[:id] == nil
      params[:id] = 2
    end  

    case params[:id].to_i
      when 1
        # Past
        @showings = Showing.find(:all, :conditions => [ "show_time < ?", Time.now])
      when 2
        # This Week
        @showings = Showing.find(:all, :conditions => {:show_time => (Time.now)..(1.week.ago.next_week(:friday))})        
      when 3
        # Next Week
        @showings = Showing.find(:all, :conditions => {:show_time => (1.week.ago.next_week(:friday))..(Time.now.next_week(:friday))})                
      when 4
        # All Future
        @showings = Showing.find(:all, :conditions => [ "show_time > ?", Time.now])
      when 5
        # All
        @showings = Showing.find(:all)
   end
    
    @showings.sort! {|a,b| a.show_time <=> b.show_time}
  end
  
  def new
    @page_heading = "Showings :: Add Showings"
    if params[:id] == nil
      params[:id] = Film.find(:all).last.id
    end  
    
    @film = Film.find(params[:id])
  end
  
  def create
    
	if params[:ticket_types] == nil
		flash[:notice] = "You must allocate ticket types to any new showing."
		redirect_to :action => :list_by_film, :id => params[:film][:id]
		return
	end
    

    new_showings = Array.new
    for ds in params[:selectedDates].split(";")
      s = Showing.new
      s.film = Film.find(params[:film][:id])

      d = Date.parse(ds)
      #TODO: CHECK LOCAL TIME PARSE
      s.show_time = Time.mktime(d.year, d.month, d.day, params[:showtime][:hour], params[:showtime][:minute], 0, 0)
      params[:screens][:id].each {|sc| s.screens << Screen.find(sc)}

      new_showings << s
    end
    
    #Check if screens are free at appropriate times.
    
    #screen_showings = Screen.find(params[:screen][:id]).showings
    clash = false
    for s in new_showings
      for t in Showing.find(:all, :conditions => {"show_time" => s.show_time.beginning_of_day..(s.show_time.beginning_of_day + 1.day)})
        clash = (clash or s.clashes_with(t))
      end
    end

    if clash
      flash[:notice] = "Failed to create showings - the selected screen was not free at all of the selected times."          
    else
    
      for s in new_showings
        s.save
        s.ticket_types = params[:ticket_types][:id].collect {|ttid| TicketType.find(ttid)}
      end
      
      flash[:notice] = "Successfully created #{new_showings.size} showings"    
    end

    redirect_to :action => :list_by_film, :id => params[:film][:id]
  end
  
  def delete
    s = Showing.find(params[:id])    
    if s.can_delete
      s.screens.clear
      s.ticket_type_allocations.clear
      s.save
      Showing.delete(params[:id])
      flash[:notice] = "Successfully deleted showing."      
    else
      flash[:notice] = "Failed to delete showing. Tickets already sold."
    end
    
    redirect_to :back
  end
  
  def edit
    @page_heading = "Showings :: Edit Showing"
    @showing = Showing.find(params[:id])
    @ticket_types = @showing.ticket_types.collect {|tt| tt.id}
  end
  
  def update
    s = Showing.find(params[:id])
    s.ticket_types = params[:ticket_types][:id].collect {|ttid| TicketType.find(ttid)}
    s.save
    redirect_to :action => :list_by_film, :id => s.film.id
  end
  
  

end
