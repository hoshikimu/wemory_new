class CreateCartImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_images do |t|
      t.integer :post_image_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
