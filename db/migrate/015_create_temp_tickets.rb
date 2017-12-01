class CreateTempTickets < ActiveRecord::Migration
  def self.up
    create_table :temp_tickets do |t|
      t.column :ticket_type_allocation_id, :integer
      t.column :time_reserved, :datetime
      t.column :seat_number, :integer
    end

  end

  def self.down
    drop_table :temp_tickets
  end
end