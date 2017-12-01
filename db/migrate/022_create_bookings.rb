class CreateBookings < ActiveRecord::Migration
  def self.up
    add_column :sales, :customer_id, :integer
    add_column :sales, :booking_source_id, :integer
    add_column :sales, :collected, :boolean
  end

  def self.down
    remove_column :sales, :collected
    remove_column :sales, :booking_source_id
    remove_column :sales, :customer_id
  end
end
