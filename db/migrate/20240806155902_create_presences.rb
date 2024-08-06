class CreatePresences < ActiveRecord::Migration[7.0]
  def change
    create_table :presences do |t|
      t.boolean :presence
      t.string :justification
      t.references :classe, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
