class Actor < ActiveRecord::Base
	has_many :request_actors
	has_many :requests, through: :request_actors
end
