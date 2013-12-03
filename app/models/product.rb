class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price

  belongs_to :product_list, polymorphic: true
  belongs_to :collection_list, polymorphic: true
  belongs_to :favourite, polymorphic: true
end
