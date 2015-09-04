class Listing < ActiveRecord::Base
  belongs_to :amenities
  belongs_to :user
  belongs_to :image
end
