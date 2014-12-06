class ApiToken < ActiveRecord::Base
  before_create :generate_access_token
  before_create :set_expiration
  before_create :deactivate_older_key
  belongs_to :user

  scope :active, -> (user) { where(active:true, user_id: user.id) }

  def expired?
    Datetime.now >= self.expires_at
  end

  def deactivate
    self.active = false
    self.save
  end

  private

  def deactivate_older_key
    tokens = ApiToken.active(self.user).all
    if tokens.count > 0
      tokens.last.deactivate
    end
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  def set_expiration
    self.expires_at = DateTime.now + 1.year
  end
end
