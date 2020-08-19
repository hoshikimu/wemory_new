class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :user_id
      t.string :postal_code
      t.string :address
      t.string :receiver
      t.string :phone_number

      t.timestamps
    end
  end
end
