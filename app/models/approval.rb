class Approval < ApplicationRecord
  belongs_to :approver, class_name: "User", optional: true
  belongs_to :approvered, class_name: "User", optional: true

  enum permission_status: {権限なし: 1, 閲覧者: 2, 編集者: 3}
end
