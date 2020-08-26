class Shipping < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_building, presence: true
  validates :receiver, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end