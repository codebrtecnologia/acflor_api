class CreateTeamStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :team_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :registration_number
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
