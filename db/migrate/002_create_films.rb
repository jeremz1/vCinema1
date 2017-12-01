class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.column :title, :string
      t.column :length, :integer
      t.column :certificate_id, :integer
    end
    
    execute 'ALTER TABLE films ADD CONSTRAINT fk_film_certificate FOREIGN KEY ( certificate_id ) REFERENCES certificates( id ) '
    
    #f = Film.new
    #f.title = "Finding Nemo"
    #f.length = 120
    #f.certificate = Certificate.find(1)
    #f.save
    
    #f = Film.new
    #f.title = "Monsters, Inc."
    #f.length = 83
    #f.certificate = Certificate.find(1)
    #f.save
  end

  def self.down
    drop_table :films
  end
end
