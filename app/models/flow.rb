class Flow < ActiveRecord::Base
	has_many :consumers, :through => :flow_actors, :source => :actor
	has_one :provider, :through => :flow_actors, :source => :actor

	has_many :flow_actors
	
end
