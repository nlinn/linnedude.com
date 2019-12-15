class AddSlugToLabels < ActiveRecord::Migration[6.0]
  def change
    add_column :labels, :slug, :string
  end
end
