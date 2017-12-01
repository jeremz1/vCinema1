class SalesController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"
  
def list_all
  @page_heading = "Sales"
  @sales = Sale.find(:all)
end

end
