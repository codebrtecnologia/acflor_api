class CreateEventBodies < ActiveRecord::Migration[7.0]
  def change
    create_table :event_bodies do |t|
      t.references :event, null: false, foreign_key: true
      t.references :public_body, null: false, foreign_key: true

      t.timestamps
    end
  end
end
