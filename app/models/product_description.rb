class ProductDescription < ActiveRecord::Base
  attr_accessible :body, :country_id, :product_type_id, :title

  belongs_to :product_type
  belongs_to :country
end
