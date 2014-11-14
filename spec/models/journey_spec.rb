require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.describe Journey, :type => :model do
  describe 'locations association' do
    before(:all) do
      DatabaseCleaner.clean
    end

    it 'should have journey_id setted on location' do
      @journey = Journey.create!
      @journey.locations.create!

      expect(Journey.all.first.locations.first.journey_id).to eq(@journey.id)
    end

    it 'can have many locations' do
      @journey = Journey.create!
      50.times { @journey.locations.create! }

      expect(Journey.all.first.locations.count).to eq(50)
    end
  end
end
