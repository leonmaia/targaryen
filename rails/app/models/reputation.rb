class Reputation < ActiveRecord::Base
  belongs_to :profile
  belongs_to :journey
end
