class Upload < ActiveRecord::Base
	#has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "150x150>" }
	has_attached_file :attachment

	validates_attachment	:attachment,
				:precense => true,
				content_type: { content_type: ["image/jpg","image/jpeg","image/png","image/gif"]}
end
