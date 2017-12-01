class CreateOtherProductSales < ActiveRecord::Migration
  def self.up
    create_table :other_product_sales do |t|
      t.column :product_id, :integer
      t.column :sale_id, :integer
      t.column :price, :decimal, {:precision => 10, :scale => 2 }
    end
    
    execute 'ALTER TABLE other_product_sales ADD CONSTRAINT fk_other_product_sale FOREIGN KEY ( product_id ) REFERENCES products( id ) '
    execute 'ALTER TABLE other_product_sales ADD CONSTRAINT fk_sale_other_product FOREIGN KEY ( sale_id ) REFERENCES sales( id ) '
  end

  def self.down
    drop_table :other_product_sales
  end
end
