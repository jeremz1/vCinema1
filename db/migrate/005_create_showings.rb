class CreateShowings < ActiveRecord::Migration
  def self.up
    create_table :showings do |t|
      t.column :film_id, :integer
      t.column :show_time, :datetime
    end
    execute 'ALTER TABLE showings ADD CONSTRAINT fk_showing_film FOREIGN KEY ( film_id ) REFERENCES films( id ) '

    create_table :screens_showings, :id => false do |t|
      t.column :showing_id, :integer
      t.column :screen_id, :integer
    end

    execute 'ALTER TABLE screens_showings ADD CONSTRAINT fk_showing_screen FOREIGN KEY ( screen_id ) REFERENCES screens( id ) '
    execute 'ALTER TABLE screens_showings ADD CONSTRAINT fk_screen_showing FOREIGN KEY ( showing_id ) REFERENCES showings( id ) '
    
    
    #for i in 1..7
    #  s = Showing.new
    #  s.film = Film.find(1)
    #  s.show_time = (i).days.from_now
    #  s.screens << Screen.find_by_id(1)
    #  s.save
    #end
    
    #for i in 1..7
    #  s = Showing.new
    #  s.film = Film.find(2)
    #  s.show_time = (i).days.from_now
    #  s.screens << Screen.find_by_id(2)
    #  s.save
    #end
  end

  def self.down
    drop_table :screens_showings
    drop_table :showings
  end
end
