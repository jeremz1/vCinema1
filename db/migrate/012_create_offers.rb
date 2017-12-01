class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.column :name, :string
      t.column :refund_amount, :decimal, {:precision => 10, :scale => 2}
      t.column :description, :string
      t.column :automatic, :boolean
      t.column :available, :boolean
    end
    
    #o = Offer.new
    #o.name = "&pound;2 off"
    #o.refund_amount = 2
    #o.automatic = true
    #o.available = true
    #o.save
    
    o = Offer.new
    o.name = "50p off"
    o.refund_amount = 0.50
    o.automatic = false
    o.available = true
    o.save
    
  end

  def self.down
    drop_table :offers
  end
end
