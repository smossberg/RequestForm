class CreateHeadingAttachments < ActiveRecord::Migration
  def change
    create_table :heading_attachments do |t|
      t.integer :heading_id
      t.string :attachment

      t.timestamps null: false
    end
  end
end
