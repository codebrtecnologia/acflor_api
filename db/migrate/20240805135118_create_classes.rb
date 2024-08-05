class CreateClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :classes do |t|
      t.string :name
      t.datetime :date
      t.string :shift
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :deleted_at
      t.references :team, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
