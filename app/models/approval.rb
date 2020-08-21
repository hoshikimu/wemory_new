class Approval < ApplicationRecord
  belongs_to :approver, class_name: "User"
  belongs_to :approvered, class_name: "User"

  enum permission_status: {閲覧者: 0}
end
