class CreateEmailHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :email_histories do |t|
      t.references :attendance, null: false, foreign_key: true
      t.string :subject, null: false
      t.datetime :sent_at, null: false
      t.string :confirmation_token, null: false
      t.datetime :token_expiry, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
