class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :responsible
      t.string :address
      t.string :phone
      t.string :email
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
