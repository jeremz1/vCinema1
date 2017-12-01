class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :decimal, {:precision => 10, :scale => 2 }
      t.column :type, :string
      t.column :barcode, :string
      t.column :available, :boolean, {:default => true}
    end
    
    #Product.create(:name => "&pound;10 Gift Certificate", :price => 10)
    #Product.create(:name => "Random Product", :price => 5, :barcode => "02569")
    

  end

  def self.down
    drop_table :products
  end
end
