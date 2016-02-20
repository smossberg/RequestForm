class CreateRequests < ActiveRecord::Migration
 def change
	drop_table :requests
    create_table :requests do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
