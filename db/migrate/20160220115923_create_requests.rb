class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :company
      t.text :description
      t.string :owner

      t.timestamps null: false
    end
  end
end
