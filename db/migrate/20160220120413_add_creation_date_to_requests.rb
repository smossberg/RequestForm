class AddCreationDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :creation_date, :date
  end
end
