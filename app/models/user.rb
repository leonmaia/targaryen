class User < ActiveRecord::Base
  has_many :journeys
end
