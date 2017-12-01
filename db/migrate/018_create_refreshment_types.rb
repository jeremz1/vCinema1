class CreateRefreshmentTypes < ActiveRecord::Migration
  def self.up
    create_table :refreshment_types do |t|
      t.column :name, :string
    end
    
    RefreshmentType.new(:name => "Soft Drink").save
    RefreshmentType.new(:name => "Alcohol").save
    RefreshmentType.new(:name => "Snack").save
    RefreshmentType.new(:name => "Sweet").save
    RefreshmentType.new(:name => "Ice").save

  end

  def self.down
    drop_table :refreshment_types
  end
end
