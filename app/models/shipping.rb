class Shipping < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :receiver, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end