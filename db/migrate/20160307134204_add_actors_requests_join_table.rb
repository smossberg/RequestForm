class AddActorsRequestsJoinTable < ActiveRecord::Migration
  def self.up
	create_table :actors_requests, :id => false do |t|
		t.integer :request_id
		t.integer :actor_id
	end
  end
	def self.down
		drop_table :actors_requests
	end
end
