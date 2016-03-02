class CreateApplicationLandscapes < ActiveRecord::Migration
  def change
    create_table :application_landscapes do |t|
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
