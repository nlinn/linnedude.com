class CreatePostLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :post_labels do |t|
      t.bigint :post_id, null: false
      t.bigint :label_id, null: false
    end
  end
end
