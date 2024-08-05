class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :code
      t.datetime :start
      t.datetime :closing
      t.boolean :active
      t.datetime :deleted_at
      t.references :course, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
