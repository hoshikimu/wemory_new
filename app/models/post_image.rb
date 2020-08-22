class PostImage < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :cart_images, dependent: :destroy
  validates :image, presence: true
  validates :introduction, length: {maximum: 20}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def cart_added_by?(user)
    cart_images.where(user_id: user.id).exists?
  end
end
