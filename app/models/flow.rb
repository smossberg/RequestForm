class Flow < ActiveRecord::Base
	has_many :consumers, :through => :flow_actors, :source => :actor
	has_many :providers, :through => :flow_actors, :source => :actor

	has_many :flow_actors

	belongs_to :request
	
end
