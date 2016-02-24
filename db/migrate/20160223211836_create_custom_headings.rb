class CreateCustomHeadings < ActiveRecord::Migration
  def change
    create_table :custom_headings do |t|
      t.string :header
      t.text :description
      t.integer :ch_context_id
      t.string :ch_context_type

      t.timestamps null: false
    end
  end
end
