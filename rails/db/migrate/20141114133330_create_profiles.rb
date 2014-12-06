class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :about
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
