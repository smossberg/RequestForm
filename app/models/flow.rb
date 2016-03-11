class Flow < ActiveRecord::Base
	has_many :consumers, :through => :flow_consumers, :source => :actor
	has_many :providers, :through => :flow_providers, :source => :actor

	has_many :flow_consumers
	has_many :flow_providers

	belongs_to :request
	
end
