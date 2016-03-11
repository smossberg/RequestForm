class AddRequestToFlows < ActiveRecord::Migration
  def change
	add_reference :flows, :request, index: true
  end
end
