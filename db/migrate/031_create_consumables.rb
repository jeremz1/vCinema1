class CreateConsumables < ActiveRecord::Migration
  def self.up
    create_table :consumables do |t|
     t.column :name, :string
     t.column :stock_level, :integer
     t.column :reorder_level, :integer
     t.column :desired_level, :integer
    end
    
    create_table :consumables_products, :id => false do |t|
      t.column :consumable_id, :integer
      t.column :product_id, :integer
    end
    
    execute 'ALTER TABLE consumables_products ADD CONSTRAINT fk_consumables_products_consumable FOREIGN KEY ( consumable_id ) REFERENCES consumables( id ) '
    execute 'ALTER TABLE consumables_products ADD CONSTRAINT fk_consumables_products_product FOREIGN KEY ( product_id ) REFERENCES products( id ) '  
  
    #c = Consumable.new(:name => "Small Cup", :stock_level => 100, :reorder_level => 50, :desired_level => 150)
    #c.products << Product.find(3)
    #c.save
    
  
  end

  def self.down
    drop_table :consumables_products
    drop_table :consumables
  end
end
