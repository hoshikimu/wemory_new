class Order < ApplicationRecord
  belongs_to :user
  has_many :order_images, dependent: :destroy

  enum payment_method: {クレジットカード: 0, 銀行振込: 1}
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :receiver, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :quantity, presence: true
end
