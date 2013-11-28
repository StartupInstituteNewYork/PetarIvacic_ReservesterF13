class Venue < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :owner
end
