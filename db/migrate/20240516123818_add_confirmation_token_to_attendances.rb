class AddConfirmationTokenToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :confirmation_token, :string
    add_index :attendances, :confirmation_token, unique: true
  end
end
