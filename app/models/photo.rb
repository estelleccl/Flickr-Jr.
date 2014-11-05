class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :filename, ImageUploader
end
