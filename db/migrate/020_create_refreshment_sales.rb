class CreateRefreshmentSales < ActiveRecord::Migration
  def self.up
    create_table :refreshment_sales do |t|
      t.column :refreshment_id, :integer
      t.column :sale_id, :integer
      t.column :price, :decimal, {:precision => 10, :scale => 2 }
    end
    
    execute 'ALTER TABLE refreshment_sales ADD CONSTRAINT fk_refreshment_sale FOREIGN KEY ( refreshment_id ) REFERENCES products( id ) '
    execute 'ALTER TABLE refreshment_sales ADD CONSTRAINT fk_sale_refreshment FOREIGN KEY ( sale_id ) REFERENCES sales( id ) '

  end

  def self.down
    drop_table :refreshment_sales
  end
end
