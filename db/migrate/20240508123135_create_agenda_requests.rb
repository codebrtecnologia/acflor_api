class CreateAgendaRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :agenda_requests do |t|
      t.string :cellphone_number, null: false
      t.string :email, null: false
      t.string :local, null: true
      t.string :subject, null: true
      t.string :observations, null: true
      t.string :infos, null: true
      t.integer :status, null: false, default: 1
      t.references :city, null: true, foreign_key: true
      t.references :requester, null: false, foreign_key: { to_table: :people }
      t.references :requested, null: false, foreign_key: { to_table: :people }
      t.references :requesting_user, null: false, foreign_key: { to_table: :users }
      t.references :approving_user, null: true, foreign_key: { to_table: :users }
      t.date :approval_date, null: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
