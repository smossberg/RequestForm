class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
      t.string :title
      t.text :text
      t.references :headerable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
