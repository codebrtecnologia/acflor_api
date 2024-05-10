class AddDeletedAtToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :deleted_at, :datetime, if_not_exists: true
    add_index :attendances, :deleted_at
  end
end
