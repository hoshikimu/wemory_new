class ChangeCategoryIdOfPostImages < ActiveRecord::Migration[5.2]
  def up
    change_column :post_images, :category_id, :integer, default: nil
  end

  def down
    change_column :post_images, :category_id, :integer, default: 0
  end
end
