class Item < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :collection, optional: true


  def brand_name=(name)
    self.brand = Brand.find_or_create_by(name: name)
  end

  def brand_attributes=(brand)
    # binding.pry
    self.brand = Brand.find_or_create_by(name: brand["name"])
    self.brand.update(brand)
    # binding.pry
    # brand_attributes.values.each do |brand_attribute|
    #   brand = Brand.find_or_create_by(brand_attribute)
    #   self.brands << brand
    
  end

  def collection_attributes=(collection)
    # binding.pry
    self.collection = Collection.find_by(id: collection.id)
    self.collection.update(collection)
  end

  # def collection_name=(title)
  #   self.collection = Collection.find_or_create_by(title: title)
  # end


end

