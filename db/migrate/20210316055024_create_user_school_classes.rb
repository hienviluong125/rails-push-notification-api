class CreateUserSchoolClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_school_classes do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
