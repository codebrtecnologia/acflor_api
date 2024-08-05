class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :course_preference_1, null: true, foreign_key: {to_table: :courses}
      t.references :course_preference_2, null: true, foreign_key: {to_table: :courses}
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
