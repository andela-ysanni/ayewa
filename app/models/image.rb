class Image < ActiveRecord::Base
  belongs_to :listing
  mount_uploader :name, ImageUploader
end
