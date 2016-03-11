class CreateFlowConsumers < ActiveRecord::Migration
  def change
    create_table :flow_consumers do |t|

      t.timestamps null: false
    end
  end
end
