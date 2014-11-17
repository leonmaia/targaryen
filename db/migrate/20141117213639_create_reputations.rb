class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.integer :up_votes
      t.integer :down_votes
      t.string :title

      t.timestamps
    end
  end
end
