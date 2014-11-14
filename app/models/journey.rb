class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :locations

  validates_presence_of :user_id
end
