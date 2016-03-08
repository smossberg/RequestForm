class AddRequestToFlows < ActiveRecord::Migration
  def change
	add_reference :requests, :request, index: true
  end
end
