class FilmsController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
  def list
    @page_heading = "Films"
  end
  
  def edit
    @page_heading = "Films :: Edit \"#{Film.find(params[:id]).title}\""
    @film = Film.find(params[:id].to_i)
  end
  
  def update
	if params[:film][:length] == ""
		params[:film][:length] = 120
	end
	
    Film.find(params[:id]).update_attributes(params[:film])
    flash[:notice] = "Successfully updated \"#{params[:film][:title]}\""
    redirect_to :action => :list
  end
  
  def new
    redirect_to :action => :edit, :id => Film.create(:title => "New Film", :length => 120, :certificate_id => 4).id
  end
  
  def delete
    title = Film.find(params[:id]).title
    begin
      Film.delete(params[:id])
      flash[:notice] = "Successfully deleted \"#{title}\""
    rescue Exception
      flash[:notice] = "Could not delete \"#{title}\" - It is linked to other parts of the database."
    end

    redirect_to :action => :list
  end
  
  def show
    @film = Film.find(params[:id])
    @page_heading = "Films :: \"#{@film.title}\""
  end
  
end
