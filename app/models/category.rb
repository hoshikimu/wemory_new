  class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_images, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: {maximum: 10}
end
