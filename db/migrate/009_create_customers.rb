class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.column :name, :string
      t.column :telephone, :string
      t.column :email, :string
    end
    
    #Customer.new(:name => "Ian Davies", :telephone => "07792 338514", :email => "iandavies@cantab.net").save
    #Customer.new(:name => "Joe Bloggs", :telephone => "01234 567890", :email => "joe@bloggs.com").save
    #Customer.new(:name => "Helen Davies", :telephone => "01944 759080", :email => "helendavies1992@hotmail.com").save
    #Customer.new(:name => "Christian Richardt", :telephone => "09876 543212", :email => "cr333@cam.ac.uk").save
    
  end

  def self.down
    drop_table :customers
  end
end
