class RemoveColumnFromRequest < ActiveRecord::Migration
  def change
	remove_column :requests, :company
	remove_column :requests, :creation_date
  end
end
