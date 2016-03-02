class Request < ActiveRecord::Base
	has_one :business_context, :class_name => "BusinessContext"
	has_one :application_landscape, :class_name => "ApplicationLandscape"
	validates :name, presence: true, length: { minimum: 5 }
end
