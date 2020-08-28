class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :user_id, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :prefecture_code, null: false, default: ""
      t.string :address_city, null: false, default: ""
      t.string :address_street, null: false, default: ""
      t.string :address_building, default: ""
      t.string :receiver, null: false, default: ""
      t.string :phone_number, null: false, default: ""

      t.timestamps
    end
  end
end
