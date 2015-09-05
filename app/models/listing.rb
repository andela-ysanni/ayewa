class Listing < ActiveRecord::Base

  default_scope {order('created_at DESC')}
  enum status: [:open, :closed]

  #validations
  validates :status, inclusion: { in: %w(close open) }
  validates :name, presence: true
  validates :address, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_many :amenities
  belongs_to :user
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images


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
