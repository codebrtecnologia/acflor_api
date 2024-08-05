class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :area_of_expertise
      t.string :teaching_experience
      t.string :professional_experience
      t.bigint :cnpj_mei
      t.datetime :deleted_at
      t.references :deficiency, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
