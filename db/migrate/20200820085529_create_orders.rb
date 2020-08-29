class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :postal_code, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building, default: ""
      t.string :receiver, null: false
      t.string :phone_number, null: false
      t.integer :quantity, null: false
      t.integer :postage, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :total, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
