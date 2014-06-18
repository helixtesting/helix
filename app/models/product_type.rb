class ProductType < ActiveRecord::Base
  attr_accessible :country_id, :body, :title
  # has_one :product_description
  belongs_to :country
end
