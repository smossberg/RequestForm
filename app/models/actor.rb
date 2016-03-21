class Actor < ActiveRecord::Base
	has_many :request_actors
	has_many :requests, through: :request_actors
	has_many :flow_provider
	has_many :flow_consumer
	has_many :flows_as_provider, through: :flow_provider , source: :flow
	has_many :flows_as_consumer, through: :flow_consumer, source: :flow
end
