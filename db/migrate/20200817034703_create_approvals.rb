class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.integer :approver_id
      t.integer :approvered_id
      t.integer :permission_status, default: 0, null: false

      t.timestamps
    end
  end
end
