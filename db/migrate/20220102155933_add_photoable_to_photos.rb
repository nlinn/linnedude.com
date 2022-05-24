class AddPhotoableToPhotos < ActiveRecord::Migration[6.1]
  def change
     add_reference :photos, :photoable, polymorphic: true, index: true
     change_column :photos, :post_id, :bigint, null: true
  end
end
