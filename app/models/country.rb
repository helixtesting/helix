class Country < ActiveRecord::Base
  attr_accessible :code, :name, :currency
  has_many :cities
  has_many :states
  has_many :locations

  validates :name, presence: true
end
