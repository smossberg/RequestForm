class Heading < ActiveRecord::Base
  belongs_to :headerable, polymorphic: true
	has_many :heading_attachments
	accepts_nested_attributes_for :heading_attachments
end
