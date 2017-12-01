class CreateProductOffers < ActiveRecord::Migration
  def self.up
    create_table :product_offers do |t|
      t.column :product_id, :integer
      t.column :offer_id, :integer
      t.column :quantity_required, :integer
    end
    
    execute 'ALTER TABLE product_offers ADD CONSTRAINT fk_product_offer FOREIGN KEY ( product_id ) REFERENCES products( id ) '
    execute 'ALTER TABLE product_offers ADD CONSTRAINT fk_offer_product FOREIGN KEY ( offer_id ) REFERENCES offers( id ) '
    
    #o = Offer.find(1)
    #o.products = TicketType.find(:all)
    #o.save
    

    
  end

  def self.down
    drop_table :product_offers
  end
end
