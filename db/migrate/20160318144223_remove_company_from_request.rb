class RemoveCompanyFromRequest < ActiveRecord::Migration
  def change
	remove_column :requests, :company
  end
end
