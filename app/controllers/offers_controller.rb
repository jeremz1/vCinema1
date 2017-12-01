class OffersController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
  def list
    @page_heading = "Offers"
    if (params[:id] == nil)
      @offers = Offer.find(:all)
    else
      @product = Product.find(params[:id])
      pos = ProductOffer.find(:all, :conditions => {:product_id => params[:id]})
      @offers = (pos.collect {|po| po.offer_id}).collect {|oid| Offer.find(oid)}
    end

  end
  
  def edit
    @offer = Offer.find(params[:id])
    @page_heading = "Offers :: Edit"
  end
  
  def update
    o = Offer.find(params[:id])
    o.update_attributes(params[:offer])
    
    flash[:notice] = "Successfully updated offer."
    redirect_to :action => :list
  end
  
  def add_product
    po = ProductOffer.find(:first, :conditions => {:offer_id => params[:id], :product_id => params[:product][:id]})
    if po == nil
      # Create new ProductOffer
      ProductOffer.new(:offer_id => params[:id], :product_id => params[:product][:id], :quantity_required => params[:product][:quantity]).save
    else
      # Update quantity on existing ProductOffer
      po.quantity_required += params[:product][:quantity].to_i
      po.save
    end
  
    redirect_to :action => :edit, :id => params[:id]
  end
  
  def remove_product_offer
    ProductOffer.delete(params[:id])
    redirect_to :back
  end
  
  def new
    o = Offer.new(:name => "New Offer", :refund_amount => 1, :automatic => false, :available => true)
    o.save
    redirect_to :action => :edit, :id => o.id
  end
  
  def delete
    o = Offer.find(params[:id])
    o.product_offers.clear
    o.save
    Offer.delete(o.id)
    redirect_to :back
  end
end
