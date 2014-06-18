class ProductDescription < ActiveRecord::Base
  attr_accessible :description_silver_kit, :description_gold_kit, :country_id, :property_title #, :product_type_id

  #belongs_to :product_type
  belongs_to :country
end
