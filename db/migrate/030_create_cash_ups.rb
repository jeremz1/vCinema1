class CreateCashUps < ActiveRecord::Migration
  def self.up
    create_table :cash_ups do |t|
      t.column :till_ip, :string
      t.column :user_id, :integer
      t.column :time, :datetime
      t.column :cash_amount, :decimal, {:precision => 10, :scale => 2}
      t.column :card_amount, :decimal, {:precision => 10, :scale => 2}
      t.column :cheque_amount, :decimal, {:precision => 10, :scale => 2}
    end
    


  end

  def self.down
    drop_table :cash_ups
  end
end
