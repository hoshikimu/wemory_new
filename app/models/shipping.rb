class Shipping < ApplicationRecord
  belongs_to :user, optional: true
end