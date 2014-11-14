class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :access_token
      t.datetime :expires_at
      t.references :user, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
