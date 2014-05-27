class ProductType < ActiveRecord::Base
  attr_accessible :country_id, :description, :name
  has_one :product_description
  belongs_to :country
end
