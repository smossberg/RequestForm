class RemoveToBeFromBusinessContext < ActiveRecord::Migration
  def change
    remove_column :business_contexts, :to_be_image, :string
  end
end
