class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :profile, index: true
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
