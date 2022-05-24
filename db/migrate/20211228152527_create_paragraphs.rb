class CreateParagraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphs do |t|
      t.integer :post_id
      t.integer :position
      t.string :headline
      t.string :sub_headline
      t.text :content
      t.timestamps
    end
  end
end
