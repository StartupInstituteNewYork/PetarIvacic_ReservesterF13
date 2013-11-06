class Restaurant < ActiveRecord::Base
	has_one :address
	mount_uploader :image, ImageUploader

end
