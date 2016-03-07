class Request < ActiveRecord::Base
	has_one :business_context, :class_name => "BusinessContext"
	has_and_belongs_to_many :actors,  :class_name => "Actor", :join_table => "actors_requests"
	validates :name, presence: true, length: { minimum: 5 }
end
