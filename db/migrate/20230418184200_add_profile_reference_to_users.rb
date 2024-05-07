class AddProfileReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :ability_profile, foreign_key: { to_table: :ability_profiles, on_delete: :nullify }, null: true
  end
end
