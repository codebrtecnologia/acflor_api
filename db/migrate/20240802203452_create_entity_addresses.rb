class CreateEntityAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :zip_code
      t.datetime :deleted_at
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
