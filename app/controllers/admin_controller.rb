class AdminController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  
  def home
    @page_heading = "Home"
    @low_stock_refreshments = Refreshment.find(:all)
    @low_stock_refreshments.collect! {|r| (r.stock_level <= r.reorder_level ? r : nil)}.compact!
    
    @low_stock_consumables = Consumable.find(:all)
    @low_stock_consumables.collect! {|c| (c.stock_level <= c.reorder_level ? c : nil)}.compact!
  end
  
  def login
    @page_heading = "Login"
    if request.post?
      u = User.authenticate_admin(params[:user][:username], params[:user][:password])
      if u.nil?
        @user = User.new
        @user.username = params[:user][:username]
      else
        session[:admin_user] = u
        if session[:admin_user].hashed_admin_password == Digest::SHA1.hexdigest(u.username)
          redirect_to :controller => :admin, :action => :new_admin_password
        else
          redirect_to :controller => :admin, :action => :home
        end
      end
    end
  end
  
  def new_admin_password  
    if request.post?
      u = session[:admin_user]
      if params[:user][:password1] != params[:user][:password2]
        flash[:notice] = "The two passwords entered do not match, please try again."
        params[:user][:password1] = ""
        params[:user][:password2] = ""
      else
        u.admin_password = params[:user][:password1]
        u.save
        redirect_to :action => :home
      end
    end
  end
  
  def logout
    session[:admin_user] = nil
    redirect_to :action => :login
  end
end
