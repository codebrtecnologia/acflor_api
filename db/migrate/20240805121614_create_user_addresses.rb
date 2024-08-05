class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :zip_code
      t.datetime :deleted_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
