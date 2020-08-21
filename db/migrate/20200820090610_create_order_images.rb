class CreateOrderImages < ActiveRecord::Migration[5.2]
  def change
    create_table :order_images do |t|
      t.integer :order_id, null: false
      t.integer :post_image_id, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
