class CreateOfferSales < ActiveRecord::Migration
  def self.up
  
    create_table :offer_sales do |t|
      t.column :offer_id, :integer
      t.column :sale_id, :integer
      t.column :refund_amount, :decimal, {:precision => 10, :scale => 2 }
    end
    
    execute 'ALTER TABLE offer_sales ADD CONSTRAINT fk_offer_sale FOREIGN KEY ( offer_id ) REFERENCES offers( id ) '
    execute 'ALTER TABLE offer_sales ADD CONSTRAINT fk_sale_offer FOREIGN KEY ( sale_id ) REFERENCES sales( id ) '
  end

  def self.down
    drop_table :offer_sales
  end
end
