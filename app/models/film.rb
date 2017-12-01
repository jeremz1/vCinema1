class Film < ActiveRecord::Base
  has_many :showings
  belongs_to :certificate
  
  def self.find_all_bookable_films
    all_future_showings_grouped_by_film = Showing.find(:all, :conditions=> {"show_time" => (Time.now - 2.hours)..(Time.now + 10.years)}, :group => "film_id")
    return all_future_showings_grouped_by_film.map{ |s| s.film }
  end
  
  def find_all_bookable_showings
    ss = self.showings
    future_showings = ss.filter {|s| (s.show_time <=> s.film.length.minutes.ago) > 0}
    return future_showings
  end
end