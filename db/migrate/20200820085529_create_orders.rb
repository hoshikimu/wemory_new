class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :prefecture_code, null: false, default: ""
      t.string :address_city, null: false, default: ""
      t.string :address_street, null: false, default: ""
      t.string :address_building, default: ""
      t.string :receiver, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.integer :quantity, null: false, default: ""
      t.integer :postage, null: false, default: ""
      t.integer :payment_method, null: false, default: 0
      t.integer :total, null: false, default: ""
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
