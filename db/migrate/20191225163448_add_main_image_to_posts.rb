class AddMainImageToPosts < ActiveRecord::Migration[6.0]
  def change
     add_column :posts, :main_image_data, :jsonb 
  end
end
