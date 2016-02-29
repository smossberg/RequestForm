class RemoveDescriptionFromBusinessContext < ActiveRecord::Migration
  def change
    remove_column :business_contexts, :description, :text
  end
end
