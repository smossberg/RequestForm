class Heading < ActiveRecord::Base
  belongs_to :headerable, polymorphic: true
	has_many :uploads
end
