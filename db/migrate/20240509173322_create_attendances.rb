class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :event, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.boolean :confirmed_presence, null: false, default: false
      t.date :confirmation_date, null: true
      t.boolean :attended_the_event, null: true
      t.string :role, null: true
      t.string :observations, null: true
      t.timestamps
    end
  end
end
