class CreateEventDates < ActiveRecord::Migration[7.0]
  def change
    create_table :event_dates do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }, index: true
      t.datetime :start_time, null: false, default: -> { 'CURRENT_TIMESTAMP' }, index: true
      t.datetime :end_time, null: false, default: -> { 'CURRENT_TIMESTAMP' }, index: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
