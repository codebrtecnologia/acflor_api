class CreateTeamStudentDiciplines < ActiveRecord::Migration[7.0]
  def change
    create_table :team_student_diciplines do |t|
      t.references :team_student, null: false, foreign_key: true
      t.references :dicipline, null: false, foreign_key: true
      t.references :dicipline_status, null: false, foreign_key: true
      t.boolean :active
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
