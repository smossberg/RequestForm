class AddHeadingRefToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :heading, index: true, foreign_key: true
  end
end
