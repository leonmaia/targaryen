class AddVenueIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :venue_id, :string
  end
end
