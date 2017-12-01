class CreateRefreshments < ActiveRecord::Migration

  def self.up
    add_column :products, :refreshment_type_id, :integer
    add_column :products, :stock_level, :integer
    add_column :products, :reorder_level, :integer
    add_column :products, :desired_level, :integer
    
    #Refreshment.new(:refreshment_type_id => 1, :name => "Coke", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "Lilt", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "Sprite", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "Fanta", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "J2O", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "Water", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 1, :name => "7-Up", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save

    #Refreshment.new(:refreshment_type_id => 2, :name => "Beer", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 2, :name => "Wine", :price => 2, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save

    #Refreshment.new(:refreshment_type_id => 3, :name => "Pringles", :price => 1.50, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save
    #Refreshment.new(:refreshment_type_id => 4, :name => "Jelly Babies", :price => 1.50, :stock_level => 100, :reorder_level => 50, :desired_level => 150).save

    Refreshment.new(:refreshment_type_id => 1, :name => "Tea", :price => 0.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Coffee", :price => 0.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Hot Chocolate", :price => 0.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Highland Spring still Sport", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Volvic Water", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Harrogate Sparkling", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Blue Keld Mineral Water", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Harrogate Spa still Sport", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Kids Post Mix", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Flavoured Water", :price => 1.1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Special Hot Drink", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "J2O Orange & Passion Fruit", :price => 1.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "J2O Orange & Cranberry", :price => 1.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "J2O Apple & Mango", :price => 1.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Regular Post Mix", :price => 1.7, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Large  Post Mix", :price => 2.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Small Squash", :price => 0.3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Large Squash", :price => 0.6, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 1, :name => "Tonic Water", :price => 0.6, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    
    Refreshment.new(:refreshment_type_id => 2, :name => "Gordons Dry Gin", :price => 1.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Carlsberg 275ml", :price => 1.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Strongbow 275ml", :price => 1.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Grouse Whisky", :price => 1.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Malibu Rum", :price => 1.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Jack Daniels", :price => 1.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Alco POP", :price => 2.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Stowells Red Wine", :price => 2.35, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "House Red", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "500ml Beer", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "BEER / Lager", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Baileys", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "House White", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 2, :name => "Budveiser BUDVAR", :price => 2.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    
    Refreshment.new(:refreshment_type_id => 3, :name => "Polos", :price => 0.3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Chocolate Orange Bar", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "tictac freshmint", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "tictac orange", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Cadbury Fruit & Nut", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "tictac lime & orange", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "tictac spearmint", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Kit-Kat Chunky", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Mars Bar", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Toblerone", :price => 0.48, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Tasters - Fruit + Nut", :price => 0.55, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Dairy Milk Tasters", :price => 0.55, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles Salt + Vinegar", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles Cheese + Onion", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles - Sour Cream + Onion", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles Cheese and Onion", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "K. Chips - Salt + Vinegar", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "K. Chips - Salt + Pepper", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles Smoky Bacon", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Kids Popcorn", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Pringles - Original", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Kettle Chips Lightly Salted", :price => 0.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Feast Original", :price => 0.9, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "K. Chips - Cheddar & Chive", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Cornish Tub", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Regular Popcorn", :price => 1.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Small Popcorn & drink", :price => 1.65, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Hot Dog Regular", :price => 1.7, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Chips and dips offer price", :price => 1.75, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Salted Popcorn Bag", :price => 2.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Med Popcorn & drink", :price => 3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Large Popcorn", :price => 3.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Large Popcorn + drink", :price => 5.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Plain Bounty", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Bounty Bar", :price => 0.45, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 3, :name => "Bounty Mango + Passion Fruit", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    
    Refreshment.new(:refreshment_type_id => 4, :name => "Bag of Sweets", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Bassett's Allsorts", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Cadbury Cream Egg", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Cherry Tunes", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Chocolate Eclairs", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Crunchy Poppets", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "DRAGON EGG", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Eclairs large", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Fruit Gums", :price => 0.35, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Fruit Pastilles", :price => 0.35, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Fruity Frogs", :price => 0.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Funny Foot", :price => 0.65, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Galaxy Minstrels Handy Bag", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Giant Fruit Pop", :price => 0.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Handy Andies", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Harribo Starmix", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Jelly Babies", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Jelly Baby Bag", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Jelly Tots", :price => 0.35, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Jelly Tots (Large)", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Lion Fruit Pastilles", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Lion Fruit Salad", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "M + M's Peanut Handy Bag", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "M+ M's Choc Handy Bag", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "M+M Vanilla", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Maltesers", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Maltesers Box", :price => 1.6, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Maltesers Handy Bag", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Maltesers Small", :price => 0.7, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Milk Chocolate M & M's", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Mini Cream Egg", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Mini Eggs Tube", :price => 1.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Minstrels", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Minty Poppets", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Nestle Double Cream", :price => 0.55, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Nestle Double Cream 150g", :price => 1.15, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Nestle double cream egg", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Nestle Mivvi Strawberry", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Orange Poppets", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Pascall's Coconut Mushrooms", :price => 0, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Peanut M & M's", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Raisin Poppets", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Revels", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Revels Pouch", :price => 2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Rocket Racket", :price => 0.35, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Smarties Pop Up", :price => 0.9, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Starburst 170g", :price => 1.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Starburst Strawberry", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Toffee Poppets", :price => 0.5, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Walnut Whip", :price => 0.59, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Werther's Butter Candies", :price => 1.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Werther's Chewy Toffees", :price => 1.25, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "Wine Gums", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 4, :name => "ZooStick Orange/Strawb", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    
    Refreshment.new(:refreshment_type_id => 5, :name => "Bounty Ice Cream", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Calippo", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Classico", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Classico", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto L Potion No1", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto L Potion No2", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Love Potion No 3", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Love Potion No 4", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Mint", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Strawb", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Strawberry", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Cornetto Whippy", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "FAB Ice Lolly", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Fruit Pastil Lolly", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum - Glutony", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum Classic", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum Revenge", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum Sins-SLOTH!", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum Vanity", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Magnum White", :price => 1.2, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Mars Ice Cream", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Mini Milk - Vanilla", :price => 0.3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Mini Milk Chocolate", :price => 0.3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Mini Milk strawberry", :price => 0.3, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Ribena Ice", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Solero Exotic", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Solero Exotic", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Solero Shots Berry", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Solero Shots Lem+Kiwi", :price => 1, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Strawberry calipo", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Twister", :price => 0.8, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save
    Refreshment.new(:refreshment_type_id => 5, :name => "Twix Ice Cream", :price => 0.85, :stock_level => 100, :desired_level => 150, :reorder_level => 50).save

  end

  def self.down
    remove_column :products, :refreshment_type_id
    remove_column :products, :stock_level
    remove_column :products, :reorder_level
    remove_column :products, :desired_level
  end
end
