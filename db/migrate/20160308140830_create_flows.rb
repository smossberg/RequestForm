class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name
      t.text :objective
      t.string :size
      t.string :security

      t.timestamps null: false
    end
  end
end
