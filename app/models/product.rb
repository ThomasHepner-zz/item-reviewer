# Model for a product
class Product < ActiveRecord::Base
  has_many :reviews
end
