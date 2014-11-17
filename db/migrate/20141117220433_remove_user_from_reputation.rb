class RemoveUserFromReputation < ActiveRecord::Migration
  def change
    remove_reference :reputations, :user, index: true
  end
end
