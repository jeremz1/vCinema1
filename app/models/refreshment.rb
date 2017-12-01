class Refreshment < Product
  has_many :sales, :through => :refreshment_sales
  belongs_to :refreshment_type
end
