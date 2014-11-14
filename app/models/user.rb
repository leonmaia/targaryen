class User < ActiveRecord::Base
  has_many :journeys
  validates_presence_of :email, :username
end
