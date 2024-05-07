class CreateAbilityPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_permissions do |t|
      t.references :ability_profile, null: false, foreign_key: { on_delete: :cascade }
      t.references :ability_action, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
