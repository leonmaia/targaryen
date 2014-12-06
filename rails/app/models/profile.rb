class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :reputation

  after_create :create_reputation

  def create_reputation
    Reputation.create(profile: self)
  end
end
