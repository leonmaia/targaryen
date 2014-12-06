require 'rails_helper'

RSpec.describe Profile, :type => :model do
  describe Profile do
    it { should belong_to(:user) }
  end
end
