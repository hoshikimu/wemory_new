class OrderImage < ApplicationRecord
  attachment :image
  belongs_to :post_image
  belongs_to :order
end
