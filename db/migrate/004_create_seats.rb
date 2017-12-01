class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.column :row, :string
      t.column :column, :string
      t.column :x_pos, :decimal, {:precision => 10, :scale => 2 }
      t.column :y_pos, :decimal, {:precision => 10, :scale => 2 }
      t.column :screen_id, :integer
    end
    
    execute 'ALTER TABLE seats ADD CONSTRAINT fk_seat_screen FOREIGN KEY ( screen_id ) REFERENCES screens( id ) '
  
    Seat.new(:row => "7", :column => "A", :x_pos => 0, :y_pos => 0, :screen_id => 1).save
    Seat.new(:row => "7", :column => "B", :x_pos => 1.4, :y_pos => 0, :screen_id => 1).save
    Seat.new(:row => "7", :column => "C", :x_pos => 2.8, :y_pos => 0, :screen_id => 1).save
    Seat.new(:row => "7", :column => "D", :x_pos => 4.2, :y_pos => 0, :screen_id => 1).save
    Seat.new(:row => "7", :column => "E", :x_pos => 5.6, :y_pos => 0, :screen_id => 1).save
    Seat.new(:row => "7", :column => "F", :x_pos => 7, :y_pos => 0, :screen_id => 1).save
    
    Seat.new(:row => "6", :column => "A", :x_pos => 0, :y_pos => 1, :screen_id => 1).save
    Seat.new(:row => "6", :column => "B", :x_pos => 1.4, :y_pos => 1, :screen_id => 1).save
    Seat.new(:row => "6", :column => "C", :x_pos => 2.8, :y_pos => 1, :screen_id => 1).save
    Seat.new(:row => "6", :column => "D", :x_pos => 4.2, :y_pos => 1, :screen_id => 1).save
    Seat.new(:row => "6", :column => "E", :x_pos => 5.6, :y_pos => 1, :screen_id => 1).save
    Seat.new(:row => "6", :column => "F", :x_pos => 7, :y_pos => 1, :screen_id => 1).save

    Seat.new(:row => "5", :column => "A", :x_pos => 0, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "B", :x_pos => 1, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "C", :x_pos => 2, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "D", :x_pos => 3, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "E", :x_pos => 4, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "F", :x_pos => 5, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "G", :x_pos => 6, :y_pos => 2, :screen_id => 1).save
    Seat.new(:row => "5", :column => "H", :x_pos => 7, :y_pos => 2, :screen_id => 1).save
  
    Seat.new(:row => "4", :column => "A", :x_pos => 0, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "B", :x_pos => 1, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "C", :x_pos => 2, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "D", :x_pos => 3, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "E", :x_pos => 4, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "F", :x_pos => 5, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "G", :x_pos => 6, :y_pos => 3, :screen_id => 1).save
    Seat.new(:row => "4", :column => "H", :x_pos => 7, :y_pos => 3, :screen_id => 1).save

    Seat.new(:row => "3", :column => "A", :x_pos => 0, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "B", :x_pos => 1, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "C", :x_pos => 2, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "D", :x_pos => 3, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "E", :x_pos => 4, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "F", :x_pos => 5, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "G", :x_pos => 6, :y_pos => 4, :screen_id => 1).save
    Seat.new(:row => "3", :column => "H", :x_pos => 7, :y_pos => 4, :screen_id => 1).save
    
    Seat.new(:row => "2", :column => "A", :x_pos => 0, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "B", :x_pos => 1, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "C", :x_pos => 2, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "D", :x_pos => 3, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "E", :x_pos => 4, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "F", :x_pos => 5, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "G", :x_pos => 6, :y_pos => 5, :screen_id => 1).save
    Seat.new(:row => "2", :column => "H", :x_pos => 7, :y_pos => 5, :screen_id => 1).save

    Seat.new(:row => "1", :column => "A", :x_pos => 0, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "B", :x_pos => 1.17, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "C", :x_pos => 2.33, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "D", :x_pos => 3.5, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "E", :x_pos => 4.67, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "F", :x_pos => 5.83, :y_pos => 6, :screen_id => 1).save
    Seat.new(:row => "1", :column => "G", :x_pos => 7, :y_pos => 6, :screen_id => 1).save

    Seat.new(:row => "7", :column => "A", :x_pos => 0, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "B", :x_pos => 1.2, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "C", :x_pos => 2.4, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "D", :x_pos => 3.6, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "E", :x_pos => 4.8, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "F", :x_pos => 6, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "G", :x_pos => 7.2, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "H", :x_pos => 8.4, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "I", :x_pos => 9.6, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "J", :x_pos => 10.8, :y_pos => 0, :screen_id => 2).save
    Seat.new(:row => "7", :column => "K", :x_pos => 12, :y_pos => 0, :screen_id => 2).save

    Seat.new(:row => "6", :column => "A", :x_pos => 0, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "B", :x_pos => 1.2, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "C", :x_pos => 2.4, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "D", :x_pos => 3.6, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "E", :x_pos => 4.8, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "F", :x_pos => 6, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "G", :x_pos => 7.2, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "H", :x_pos => 8.4, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "I", :x_pos => 9.6, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "J", :x_pos => 10.8, :y_pos => 1, :screen_id => 2).save
    Seat.new(:row => "6", :column => "K", :x_pos => 12, :y_pos => 1, :screen_id => 2).save

    Seat.new(:row => "5", :column => "A", :x_pos =>  0, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "B", :x_pos =>  1, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "C", :x_pos =>  2, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "D", :x_pos =>  3, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "E", :x_pos =>  4, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "F", :x_pos =>  5, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "G", :x_pos =>  6, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "H", :x_pos =>  7, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "I", :x_pos =>  8, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "J", :x_pos =>  9, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "K", :x_pos => 10, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "L", :x_pos => 11, :y_pos => 2, :screen_id => 2).save
    Seat.new(:row => "5", :column => "M", :x_pos => 12, :y_pos => 2, :screen_id => 2).save
    
    Seat.new(:row => "4", :column => "A", :x_pos =>  0, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "B", :x_pos =>  1, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "C", :x_pos =>  2, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "D", :x_pos =>  3, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "E", :x_pos =>  4, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "F", :x_pos =>  5, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "G", :x_pos =>  6, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "H", :x_pos =>  7, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "I", :x_pos =>  8, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "J", :x_pos =>  9, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "K", :x_pos => 10, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "L", :x_pos => 11, :y_pos => 3, :screen_id => 2).save
    Seat.new(:row => "4", :column => "M", :x_pos => 12, :y_pos => 3, :screen_id => 2).save
    
    Seat.new(:row => "3", :column => "A", :x_pos =>  0, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "B", :x_pos =>  1, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "C", :x_pos =>  2, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "D", :x_pos =>  3, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "E", :x_pos =>  4, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "F", :x_pos =>  5, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "G", :x_pos =>  6, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "H", :x_pos =>  7, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "I", :x_pos =>  8, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "J", :x_pos =>  9, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "K", :x_pos => 10, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "L", :x_pos => 11, :y_pos => 4, :screen_id => 2).save
    Seat.new(:row => "3", :column => "M", :x_pos => 12, :y_pos => 4, :screen_id => 2).save

    Seat.new(:row => "2", :column => "A", :x_pos =>  0, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "B", :x_pos =>  1, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "C", :x_pos =>  2, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "D", :x_pos =>  3, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "E", :x_pos =>  4, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "F", :x_pos =>  5, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "G", :x_pos =>  6, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "H", :x_pos =>  7, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "I", :x_pos =>  8, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "J", :x_pos =>  9, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "K", :x_pos => 10, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "L", :x_pos => 11, :y_pos => 5, :screen_id => 2).save
    Seat.new(:row => "2", :column => "M", :x_pos => 12, :y_pos => 5, :screen_id => 2).save

    Seat.new(:row => "1", :column => "A", :x_pos => 0, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "B", :x_pos => 1.09, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "C", :x_pos => 2.18, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "D", :x_pos => 3.27, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "E", :x_pos => 4.36, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "F", :x_pos => 5.45, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "G", :x_pos => 6.55, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "H", :x_pos => 7.64, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "I", :x_pos => 8.73, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "J", :x_pos => 9.82, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "K", :x_pos => 10.91, :y_pos => 6, :screen_id => 2).save
    Seat.new(:row => "1", :column => "L", :x_pos => 12, :y_pos => 6, :screen_id => 2).save

  end

  def self.down
    drop_table :seats
  end
end
