class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :ownerable_id
      t.string :ownerable_type
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
