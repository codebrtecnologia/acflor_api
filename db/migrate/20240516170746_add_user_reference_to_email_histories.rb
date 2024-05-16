class AddUserReferenceToEmailHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :email_histories, :user, null: false, foreign_key: true
  end
end
