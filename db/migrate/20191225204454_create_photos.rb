class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.bigint :post_id, null: false
      t.jsonb :file_data
      t.timestamps
      t.index :post_id
    end
  end
end
