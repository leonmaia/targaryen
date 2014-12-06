require 'rails_helper'

RSpec.describe Journey, :type => :model do
  describe Journey do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'locations association' do
    it 'should have journey_id setted on location' do
      @user = User.create(username: "leon", email: "hi@leon.com", 
                          password: "foobar", password_confirmation: "foobar")
      @journey = @user.journeys.create!
      @journey.locations.create!

      expect(Journey.all.first.locations.first.journey_id).to eq(@journey.id)
    end

    it 'can have many locations' do
      @user = User.create(username: "leon", email: "hi@leon.com",
                          password: "foobar", password_confirmation: "foobar")
      @journey = @user.journeys.create!
      50.times { @journey.locations.create! }

      expect(Journey.all.count).to eq(1)
      expect(Journey.all.first.locations.count).to eq(50)
    end
  end
end
