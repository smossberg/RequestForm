class Request < ActiveRecord::Base
	has_one :business_context, :class_name => "BusinessContext"
	validates :name, presence: true, length: { minimum: 5 }
end
