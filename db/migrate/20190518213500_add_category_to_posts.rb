class AddCategoryToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category, :integer, default: 0, null: false
    add_column :posts, :published, :boolean, default: false, null: false
  end
end
