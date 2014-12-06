class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :journey, index: true

      t.timestamps
    end
  end
end
