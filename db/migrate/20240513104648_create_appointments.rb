class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :title, null: false
      t.string :local, null: false
      t.datetime :initial_date, null: false
      t.datetime :final_date, null: false
      t.integer :situation, null: false, default: 1
      t.integer :repetition, null: false, default: 1
      t.string :observations, null: true
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
