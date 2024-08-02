class CreateDeficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :deficiencies do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
