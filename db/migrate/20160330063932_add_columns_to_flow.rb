class AddColumnsToFlow < ActiveRecord::Migration
  def change
	  add_column :flows, :master_data, :boolean
	  add_column :flows, :frequency, :string
  end
end
