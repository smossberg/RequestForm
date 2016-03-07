class Actor < ActiveRecord::Base
	has_and_belongs_to_many :requests, :class_name => "Request", :join_table => :actors_requests
end
