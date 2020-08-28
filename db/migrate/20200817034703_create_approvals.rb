class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.integer :approver_id, null: false, default: ""
      t.integer :approvered_id, null: false, default: ""
      t.integer :permission_status, default: 0, null: false, default: ""

      t.timestamps
    end
  end
end
