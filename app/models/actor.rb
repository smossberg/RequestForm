class Actor < ActiveRecord::Base
	has_many :request_actors
	has_many :requests, through: :request_actors
	has_many :flow_actor
	has_many :flows, through: :flow_actor
end
