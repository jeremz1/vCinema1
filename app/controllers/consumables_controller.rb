class ConsumablesController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
def list
  @page_heading = "Consumables"
  @consumables = Consumable.find(:all)
end

def delete
  name = Consumable.find(params[:id]).name
  begin
    Consumable.delete(params[:id])
    flash[:notice] = "Successfully deleted \"#{name}\""
  rescue Exception
    flash[:notice] = "Could not delete \"#{name}\" - It is linked to other parts of the database."
  end

  redirect_to :action => :list
end

def edit
  @consumable = Consumable.find(params[:id])
  @page_heading = "Consumables :: Edit \"" + @consumable.name + "\""
end

def update
  Consumable.find(params[:id]).update_attributes(params[:consumable])
  flash[:notice] = "Successfully updated consumable details."
  redirect_to :action => :list
end

def new
  c = Consumable.new(:name => "New", :stock_level => 0, :desired_level => 0, :reorder_level => 0)
  c.save
  redirect_to :action => "edit", :id => c.id
end
end
