class Owner < ActiveRecord::Base
	
  belongs_to :ownerable, polymorphic: true
end
