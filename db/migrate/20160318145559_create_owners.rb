class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.references :ownerable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
