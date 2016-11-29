# Model for a product's review
class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :content, :rating, presence: true
end
