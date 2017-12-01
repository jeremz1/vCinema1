class CreateBookingSources < ActiveRecord::Migration
  def self.up
    create_table :booking_sources do |t|
      t.column :source, :string
    end
    
    BookingSource.new(:source => "Web").save
    BookingSource.new(:source => "Telephone").save
    BookingSource.new(:source => "In Person").save
  end

  def self.down
    drop_table :booking_sources
  end
end
