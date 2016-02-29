class RemoveAsIsFromBusinessContext < ActiveRecord::Migration
  def change
    remove_column :business_contexts, :as_is_image, :string
  end
end
