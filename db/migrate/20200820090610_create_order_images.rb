class CreateOrderImages < ActiveRecord::Migration[5.2]
  def change
    create_table :order_images do |t|
      t.integer :order_id, null: false, default: ""
      t.integer :post_image_id, null: false, default: ""
      t.string :image_id, null: false, default: ""
      t.timestamps
    end
  end
end
