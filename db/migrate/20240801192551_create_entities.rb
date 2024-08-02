class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :responsible
      t.string :telephone
      t.string :email
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
