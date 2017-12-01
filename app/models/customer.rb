class Customer < ActiveRecord::Base
  has_many :bookings
  
  def fullname
    first_name + " " + last_name
  end
end
