class Screen < ActiveRecord::Base
  has_and_belongs_to_many :showings
  has_many :seats
  
def seat_count
  seats.length
end
end
