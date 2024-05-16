class AddConfirmationTokenExpiresAtToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :confirmation_token_expires_at, :datetime
  end
end
