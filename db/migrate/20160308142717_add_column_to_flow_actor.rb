class AddColumnToFlowActor < ActiveRecord::Migration
  def change
	add_column :flow_actors, :actor_id, :integer
	add_column :flow_actors, :flow_id, :integer
  end
end
