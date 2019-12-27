class DeleteMainImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :main_image_data
  end
end
