class CreateBcs < ActiveRecord::Migration
  def change
    create_table :bcs do |t|
      t.text :description
      t.string :as_is_image
      t.string :to_be_image
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
