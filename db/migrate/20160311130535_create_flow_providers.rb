class CreateFlowProviders < ActiveRecord::Migration
  def change
    create_table :flow_providers do |t|

      t.timestamps null: false
    end
  end
end
