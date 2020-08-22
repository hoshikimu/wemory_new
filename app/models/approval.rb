class Approval < ApplicationRecord
  belongs_to :approver, class_name: "User"
  belongs_to :approvered, class_name: "User"
  validates :permission_status, presence: true

  enum permission_status: {"閲覧者(アルバム注文不可)" => 0, "閲覧者(アルバム注文可)" => 1}
end
