class CustomHeading < ActiveRecord::Base
	belongs_to :ch_context, polymorphic: true
end
