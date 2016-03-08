class CreateFlowActors < ActiveRecord::Migration
  def change
    create_table :flow_actors do |t|

      t.timestamps null: false
    end
  end
end
