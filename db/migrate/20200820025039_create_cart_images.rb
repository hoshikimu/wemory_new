class CreateCartImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_images do |t|
      t.integer :post_image_id, null: false, default: ""
      t.integer :user_id, null: false, default: ""

      t.timestamps
    end
  end
end
