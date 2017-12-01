class CreateScreens < ActiveRecord::Migration
  def self.up
    create_table :screens do |t|
      t.column :name, :string

    end
    

    Screen.new(:name => "Screen 1").save
    Screen.new(:name => "Screen 2").save

  end

  def self.down
    drop_table :screens
  end
end
