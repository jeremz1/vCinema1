class ProductsController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
def list
  @page_heading = "Products1"
  @products = Product.find_all_by_type(nil)
end

def edit
  @product = Product.find(params[:id])
  @page_heading = "Products :: Edit " + @product.name
end

def update
  Product.find(params[:id]).update_attributes(params[:product])
  redirect_to :action => :list
end

def new
  p = Product.new(:name => "New Product", :price => 1)
  p.save
  redirect_to :action => :edit, :id => p.id
end

def delete
  Product.delete(params[:id])
  redirect_to :action => :list
end


end
