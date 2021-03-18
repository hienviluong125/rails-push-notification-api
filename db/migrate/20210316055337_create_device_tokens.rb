class CreateDeviceTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :device_tokens do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
