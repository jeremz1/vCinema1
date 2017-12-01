class RefreshmentsController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
  def list
    @page_heading = "Refreshments12"
    if params[:id].to_i > 0
      @refreshment_type = RefreshmentType.find(params[:id])
      @refreshments = Refreshment.find(:all, :conditions => "refreshment_type_id = #{@refreshment_type.id}")
    else
      @refreshments = Refreshment.find(:all)
    end
  end
  
  def edit
    @refreshment = Refreshment.find(params[:id])
    @page_heading = "Refreshments :: Edit \"#{@refreshment.name}\""
  end

  def update
    Refreshment.find(params[:id]).update_attributes(params[:refreshment])
    flash[:notice] = "Successfully updated refreshment details."
    redirect_to :action => :list
  end
  
  def new
    r = Refreshment.new(:name => "New", :price => 1, :stock_level => 0, :desired_level => 0, :reorder_level => 0)
    if (params[:id].to_i > 0)
      r.refreshment_type = RefreshmentType.find(params[:id])
    end
    r.save
    redirect_to :action => :edit, :id => r.id
  end
  
  def delete
    r = Refreshment.find(params[:id])
    if r.product_offers.size == 0
      Refreshment.delete(r.id)
    end
    flash[:notice] = "Successfully deleted refreshment."
    redirect_to :back
  end
  
  def add_consumable
    c = Consumable.find(params[:consumable_id])
    r = Refreshment.find(params[:id])
    r.consumables << c
    r.save
    redirect_to :action => :edit, :id => r.id
  end
  
  def remove_consumable
    r = Refreshment.find(params[:id])
    c = Consumable.find(params[:consumable_id])
    r.consumables.delete(c)
    r.save
    
    redirect_to :action => :edit, :id => r.id
  end
  
end
