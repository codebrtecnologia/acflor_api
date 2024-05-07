class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.date :date, null: false
      t.string :description, null: false
      t.integer :holiday_type, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
