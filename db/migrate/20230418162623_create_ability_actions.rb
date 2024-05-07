class CreateAbilityActions < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_actions do |t|
      t.references :ability_resource, null: false, foreign_key: { on_delete: :cascade }
      t.string :name, null: false

      t.timestamps
    end
  end
end
