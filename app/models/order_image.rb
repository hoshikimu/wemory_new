class OrderImage < ApplicationRecord
  belongs_to :post_image
  belongs_to :order
end
