class Flow < ActiveRecord::Base
	has_many :consumers, :through => :flow_actors, :source => :actor
	has_one :provider, :through => :flow_actor, :source => :actor

	has_many :flow_actors
	has_one :flow_actor

	belongs_to :request
	
end
