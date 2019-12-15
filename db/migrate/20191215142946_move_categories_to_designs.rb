class MoveCategoriesToDesigns < ActiveRecord::Migration[6.0]
  def up
    add_column :posts, :design, :string, null: false, default: 'default'

    Post.reset_column_information
    Post.all.each do |post|
      post.update_column(:design, post.category)
    end
  end
end
