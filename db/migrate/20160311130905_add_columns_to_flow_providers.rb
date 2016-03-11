class AddColumnsToFlowProviders < ActiveRecord::Migration
  def change
	add_column :flow_providers, :actor_id, :integer
	add_column :flow_providers, :flow_id, :integer
  end
end
