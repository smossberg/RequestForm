class AddColumnToRequestActor < ActiveRecord::Migration
  def change
	add_column :request_actors, :request_id, :integer
	add_column :request_actors, :actor_id, :integer
  end
end
