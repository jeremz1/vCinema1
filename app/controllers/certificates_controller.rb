class CertificatesController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  #scaffold :certificate
  
  def list
    @page_heading = "Certificates"
  end
  
  def new
    @page_heading = "Certificates :: New Certificate"
  end
  
  def create
    c = Certificate.create(params[:certificate])
    flash[:notice] = "Successfully created new \"#{c.name}\" certificate."
    redirect_to :action => :list
  end
  
  def delete
    name = Certificate.find(params[:id]).name
    begin
      Certificate.delete(params[:id])
      flash[:notice] = "Successfully deleted certificate \"#{name}\""
    rescue Exception
      flash[:notice] = "Unable to delete certificate \"#{name}\" - it is linked to other parts of the database."
    end

    redirect_to :action => :list
  end
  
  def show
    @certificate = Certificate.find(params[:id])
    @page_heading = "Certificates :: \"#{@certificate.name}\""
  end
end
