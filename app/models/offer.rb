class Offer < ActiveRecord::Base
  has_many :product_offers, :dependent => :destroy
  #has_many :products, :through => :product_offers
  
  def products=(ps)
    #TODO: Broken - only for development use
    for p in ps
      po = ProductOffer.new
      po.product = p
      po.offer = self
      po.quantity_required = 1
      po.save
    end
  end
  
  def products
    ps = Array.new
    for po in product_offers
      for i in 1..(po.quantity_required)
        ps << po.product
      end
    end
    return ps
  end
  

  def self.find_applicable(products, automatic, already_applied)

    existing_offers = already_applied.collect {|oid| Offer.find(oid)}
    #products.each {|p| puts p.price}
    matching_offers = Array.new

    ps = Array.new(products)
    old_length = nil
    while (ps.length != old_length)
      old_length = ps.length
      for o in Offer.find(:all, :conditions => {:automatic => automatic})
        if o.products.length > 0 then
          match = true
          removed_products = Array.new
          for p in o.products
            #Remove p from ps or set match = false
            found = false
            for i in 0..(ps.length - 1)
              if ps[i] != nil and not found then
                if ps[i].id == p.id then
                  removed_products << ps[i]
                  ps[i] = nil
                  found = true
                end
              end
            end
            ps.compact!
            if not found then 
              match = false
            end
          end
          if match then 
            matching_offers << o
          else
            removed_products.each {|p| ps << p}
          end
        end
      end
    end
    
    for i in 0..(matching_offers.length - 1)
      found = false
      for j in 0..(existing_offers.length - 1)
        if not found and existing_offers[j] != nil and matching_offers[i] != nil then
          if existing_offers[j].id == matching_offers[i].id then
            matching_offers[i] = nil
            existing_offers[j] = nil
            found = true
          end
        end
      end
    end
    matching_offers.compact!
    
    
    #Add any offers that don't require any products
    for o in Offer.find(:all, :conditions => {:automatic => automatic})
      if o.products.length == 0 then
        matching_offers << o
      end
    end
    
    return matching_offers
  end

end
