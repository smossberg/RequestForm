class CreateRequestActors < ActiveRecord::Migration
  def change
    create_table :request_actors do |t|

      t.timestamps null: false
    end
  end
end
