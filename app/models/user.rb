class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  before_create :generate_token
  has_secure_password

  enum status: [ :inactive, :active ]

  before_save { self.email = email.downcase }
  validates :address, :phone_number, :status, :avatar, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

   def email_activate
       self.active!
       self.confirm_token = nil
       save!(:validate => false)
  end



  private
  def generate_token
    if self.confirm_token.blank?
       self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end


end
