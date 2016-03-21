class Ownership < ActiveRecord::Base
	belongs_to :ownerable, polymorphic: true
	belongs_to :owner
end
