class UsersController < ApplicationController
  before_filter :check_authenticated_admin
  layout "admin"
  
  
  def list
    @page_heading = "Users"
    @users = User.find(:all)
  end

  def edit
    @page_heading = "Edit User"
    @user = User.find(params[:id])
  end

  def new
    u = User.new(:first_name => "New", :last_name => "User", :username => "nuser", :hashed_pin => Digest::SHA1.hexdigest("0000"))
    u.save
    redirect_to :action => "edit", :id => u.id
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.username = params[:user][:username]
 
    if @user.is_admin and params[:user][:is_admin].to_i == 0
      @user.hashed_admin_password = nil
    end

    if params[:user][:is_admin].to_i == 1 and not @user.is_admin
      @user.admin_password = @user.username
    end
	
	if params[:user][:current].to_i == 1
	  @user.current = 1
	else
	  @user.current = 0
	end
 
    @user.save
    redirect_to :action => :list
  end
      
  def timesheet
    @user = User.find(params[:id])    
  end
  
  def reset_till_pin
    @user = User.find(params[:id])
    @user.pin = "0000"
    @user.save
    flash[:notice] = "The till pin for #{@user.full_name} has been reset to \"0000\". He/She will be required to enter a new pin next time he/she uses a till."
    redirect_to :back
  end

  def reset_admin_password
    @user = User.find(params[:id])
    @user.admin_password = @user.username
    @user.save
    flash[:notice] = "The admin password for #{@user.full_name} has been reset to \"#{@user.username}\". He/She will be required to enter a new password next time he/she logs into the admin site."
    redirect_to :back
  end

end