  class Category < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 10}
end
