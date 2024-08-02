class CreateDiciplines < ActiveRecord::Migration[7.0]
  def change
    create_table :diciplines do |t|
      t.string :name
      t.string :code
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
