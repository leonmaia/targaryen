class AddUserAndJourneyToReputation < ActiveRecord::Migration
  def change
    add_reference :reputations, :user, index: true
    add_reference :reputations, :journey, index: true
  end
end
