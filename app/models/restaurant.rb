class Restaurant < ActiveRecord::Base
	has_one :address
	mount_uploader :image, ImageUploader
	belongs_to :owner
end
