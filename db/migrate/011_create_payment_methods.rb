class CreatePaymentMethods < ActiveRecord::Migration
  def self.up
    create_table :payment_methods do |t|
      t.column :name, :string
    end
    
    PaymentMethod.new( :name => "Cash" ).save
    PaymentMethod.new( :name => "Card" ).save    
    PaymentMethod.new( :name => "Cheque" ).save
    
  end

  def self.down
    drop_table :payment_methods
  end
end
