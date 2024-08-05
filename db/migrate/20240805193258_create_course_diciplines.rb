class CreateCourseDiciplines < ActiveRecord::Migration[7.0]
  def change
    create_table :course_diciplines do |t|
      t.references :course, null: false, foreign_key: true
      t.references :dicipline, null: false, foreign_key: true
      t.boolean :active
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
