class CreateUserDeficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_deficiencies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :deficiency, null: false, foreign_key: true
      t.string :observations
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
