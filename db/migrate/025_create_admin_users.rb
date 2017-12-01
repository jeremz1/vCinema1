class CreateAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hashed_admin_password, :string
    
    AdminUser.new(:first_name => "Jeremy", :last_name => "Powell", :username => "jpowell", :hashed_pin => Digest::SHA1.hexdigest("0000"), :hashed_admin_password => Digest::SHA1.hexdigest("jpowell")).save  
    AdminUser.new(:first_name => "Ian", :last_name => "Davies", :username => "idavies", :hashed_pin => Digest::SHA1.hexdigest("0000"), :hashed_admin_password => Digest::SHA1.hexdigest("idavies")).save  

  end

  def self.down
    remove_column :users, :hashed_admin_password
  end
end
