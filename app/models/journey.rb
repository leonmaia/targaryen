class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :locations
  has_one :reputation

  validates_presence_of :user_id
end
