require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe Location do
    it { should belong_to(:journey) }  
  end
end
