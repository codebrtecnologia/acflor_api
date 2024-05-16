class AddEmailSentCountToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :email_sent_count, :integer, default: 0
  end
end
