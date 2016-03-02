class ApplicationLandscape < ActiveRecord::Base
	belongs_to :request
 	has_many :headings, as: :headerable
	accepts_nested_attributes_for :headings, :allow_destroy => true
						#allow_destroy måste finnas för att kunna ta bort custom_headings
end
