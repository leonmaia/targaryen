class RemoveProfileReferenceFromUser < ActiveRecord::Migration
  def change
    remove_reference :users, :profile, index: true
  end
end
