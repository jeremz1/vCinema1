class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.column :type, :string
      t.column :sale_time, :datetime
      t.column :user_id, :integer
      t.column :payment_method_id, :integer
      t.column :tendered, :decimal, {:precision => 10, :scale => 2}
      t.column :till_ip, :string
      t.column :card_surcharge, :decimal, {:precision => 10, :scale => 2, :default => 0}
      t.column :cheque_surcharge, :decimal, {:precision => 10, :scale => 2, :default => 0}
      t.column :refunded, :boolean, {:default => false}
    end
  end

  def self.down
    drop_table :sales
  end
end
