class AddProfileToReputation < ActiveRecord::Migration
  def change
    add_reference :reputations, :profile, index: true
  end
end
