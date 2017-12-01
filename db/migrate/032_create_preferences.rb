class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.column :setting, :string
      t.column :value, :string
    end
    
    Preference.set("card_surcharge", "0.25")
    Preference.set("card_surcharge_limit", "5.00")
    Preference.set("cheque_surcharge", "0.60")
    Preference.set("cheque_surcharge_limit", "10.00")
  end

  def self.down
    drop_table :preferences
  end
end
