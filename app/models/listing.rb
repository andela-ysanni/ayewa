class Listing < ActiveRecord::Base
  has_many :amenities
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  enum status: [:opened, :closed]

  def self.search_by(name: nil, location: nil)
    if name and location
      where("name LIKE ? OR location LIKE ?", "%#{name}%", "%#{location}%").where.not(status: statuses[:closed])
    elsif name
      where("name LIKE ?", "%#{name}%").where.not(status: statuses[:closed])
    elsif location
      where("location LIKE ?", "%#{location}%").where.not(status: statuses[:closed])
    else
      all
    end
  end
end
