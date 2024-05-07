class CreatePublicBodies < ActiveRecord::Migration[7.0]
  def change
    create_table :public_bodies do |t|
      t.string :name, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
