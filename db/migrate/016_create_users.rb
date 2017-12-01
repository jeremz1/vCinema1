class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :username, :string
      t.column :hashed_pin, :string
      t.column :saved_session, :text
      t.column :last_login, :datetime
      t.column :type, :string
    end
    
end

#TODO: By default all your post parameters including cleartext passwords will 
#appear in the rails production log. If you dont want this to happen you should 
#take steps to avoid it. E.g. Filter Logged Params Plugin
  def self.down
    drop_table :users
  end
end
