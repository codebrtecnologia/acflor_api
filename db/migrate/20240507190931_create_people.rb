class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :position, null: true
      t.string :telephone, null: true
      t.string :cellphone_number, null: true
      t.string :email, null: false
      t.string :alternative_email, null: true
      t.references :category, null: true, foreign_key: true
      t.references :public_body, null: true, foreign_key: true
      t.boolean :active, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
