class HeadingAttachment < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	belongs_to :heading
end
