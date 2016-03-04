class Upload < ActiveRecord::Base
	#has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "150x150>" }
	belongs_to :heading
	has_attached_file :attachment

	validates_attachment	:attachment,
				:precense => true,
				content_type: { content_type: ["image/jpg","image/jpeg","image/png","image/bmp","image/gif",
				"application/x-visio",
				"application/msword",
				 "application/pdf",
				"application/excel",
				"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
				"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
				"application/vnd.ms-powerpoint",
				"application/vnd.openxmlformats-officedocument.presentationml.presentation" ]}
end
