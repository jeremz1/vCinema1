class CreateCertificates < ActiveRecord::Migration
  def self.up
    create_table :certificates do |t|
      t.column :name, :string
    end
    
    Certificate.new(:name => "U").save
    Certificate.new(:name => "PG").save
    Certificate.new(:name => "12").save
    Certificate.new(:name => "12a").save
    Certificate.new(:name => "15").save
    Certificate.new(:name => "18").save

  end

  def self.down
    drop_table :certificates
  end
end
