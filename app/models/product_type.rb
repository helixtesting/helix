class ProductType < ActiveRecord::Base
  attr_accessible :country_id, :body, :title, :price
  # has_one :product_description
  belongs_to :country
  validates :price,  numericality: true 
end
