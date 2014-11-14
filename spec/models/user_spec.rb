require 'rails_helper'

RSpec.describe User, :type => :model do
  describe User do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) } 
  end
end
