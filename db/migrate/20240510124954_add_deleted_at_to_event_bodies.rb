class AddDeletedAtToEventBodies < ActiveRecord::Migration[7.0]
  def change
    add_column :event_bodies, :deleted_at, :datetime, if_not_exists: true
    add_index :event_bodies, :deleted_at
  end
end
