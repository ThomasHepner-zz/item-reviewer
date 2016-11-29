# Model for a product
class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :description, presence: true
end
