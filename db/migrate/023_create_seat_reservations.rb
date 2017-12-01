class CreateSeatReservations < ActiveRecord::Migration
  def self.up
    create_table :seat_reservations do |t|
      t.column :seat_id, :integer
      t.column :showing_id, :integer
      t.column :sale_id, :integer
      t.column :time_reserved, :datetime
    end
    
    execute 'ALTER TABLE seat_reservations ADD CONSTRAINT fk_seat_reservation_seat FOREIGN KEY ( seat_id ) REFERENCES seats( id ) '
    execute 'ALTER TABLE seat_reservations ADD CONSTRAINT fk_seat_reservation_showing FOREIGN KEY ( showing_id ) REFERENCES showings( id ) '
    #execute 'ALTER TABLE seat_reservations ADD CONSTRAINT fk_seat_reservation_sale FOREIGN KEY ( sale_id ) REFERENCES sales( id ) '
  
  end

  def self.down
    drop_table :seat_reservations
  end
end
