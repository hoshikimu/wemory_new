class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :user_id, null: false
      t.string :postal_code, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.string :receiver, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
