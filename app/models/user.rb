class User < ActiveRecord::Base
  has_many :journeys
  has_one :profile
 
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  after_create :create_auth_token
  after_create :create_profile

  def access_token
    token = ApiToken.active(self).first

    if token.blank?
      token = ApiToken.create(user:self, active:true)
    end
    token.access_token
  end

  private

  def create_profile
    Profile.create(user: self)
  end

  def create_auth_token
    ApiToken.create(user: self, active: true)
  end
end
