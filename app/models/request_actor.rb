class RequestActor < ActiveRecord::Base
	belongs_to :actor
	belongs_to :request
end
