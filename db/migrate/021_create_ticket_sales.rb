class CreateTicketSales < ActiveRecord::Migration
  def self.up
    create_table :ticket_sales do |t|
      t.column :ticket_id, :integer
      t.column :sale_id, :integer
      t.column :price, :decimal, {:precision => 10, :scale => 2 }
    end
    
    execute 'ALTER TABLE ticket_sales ADD CONSTRAINT fk_ticket_sale FOREIGN KEY ( ticket_id ) REFERENCES tickets( id ) '
    execute 'ALTER TABLE ticket_sales ADD CONSTRAINT fk_sale_ticket FOREIGN KEY ( sale_id ) REFERENCES sales( id ) '

  end

  def self.down
    drop_table :ticket_sales
  end
end
