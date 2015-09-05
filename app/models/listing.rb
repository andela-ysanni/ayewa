class Listing < ActiveRecord::Base
  has_many :amenities
  belongs_to :user
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images
  # enum status: [:opened, :closed]
end
