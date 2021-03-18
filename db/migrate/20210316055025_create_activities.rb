class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
