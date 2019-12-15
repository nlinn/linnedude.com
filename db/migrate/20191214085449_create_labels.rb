class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :name, null: false
      t.string :bg_color, null: false, default: '#5319e7'
      t.string :text_color, null: false, default: '#ffffff'
      t.boolean :public, null: false, default: true
      t.integer :sort, null: false, default: 0
    end
  end
end
