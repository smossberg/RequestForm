class AddColumnsToFlowConsumers < ActiveRecord::Migration
  def change
	add_column :flow_consumers, :actor_id, :integer
	add_column :flow_consumers, :flow_id, :integer
  end
end
