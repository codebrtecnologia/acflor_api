class CreateAcademicEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_events do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :local
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
