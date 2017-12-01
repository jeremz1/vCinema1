# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_vCinema1_session_id'
  
  before_filter :add_stylesheets
  
  def add_stylesheets
    @uid =((DateTime.now.sec_fraction + DateTime.now.sec).to_f * 10e12).to_i
    @stylesheets = ["main", "#{controller_name}/_controller", "#{controller_name}/#{action_name}", "calendar/red/style.css"]
  end
  
  def check_authenticated
    #puts request.env['HTTP_HOST']
    if not authenticated?
      redirect_to :action => :login
    end
  end
  
  def authenticated?
    return session[:user] != nil
  end
  
  def check_authenticated_admin
    puts request.env['HTTP_HOST']
    if session[:admin_user] == nil
      redirect_to :controller => :admin, :action => :login
    end
  end
end

class Numeric
  def as_price
    if self >= 0
      "&pound;" + format("%.2f",self)     
    else
      "-&pound;" + format("%.2f",-self)     
    end

  end
end

class Time
  def format(f)
    d = self.strftime("%d").to_i
    endings = ["st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "st"]
    self.strftime(f.gsub('%d',d.to_s + endings[d - 1]))
  end
end

class Array
  def filter
    a = Array.new
    self.each {|e| if yield e then a << e end}
    a
  end
end