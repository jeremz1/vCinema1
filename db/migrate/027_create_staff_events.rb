class CreateStaffEvents < ActiveRecord::Migration
  def self.up
    create_table :staff_events do |t|
      t.column :user_id, :integer
      t.column :type, :string
      t.column :time, :datetime
    end
    
    execute 'ALTER TABLE staff_events ADD CONSTRAINT fk_staff_event_user FOREIGN KEY ( user_id ) REFERENCES users( id ) '
  end

  def self.down
    drop_table :staff_events
  end
end
