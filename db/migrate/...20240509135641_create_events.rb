# class CreateEvents < ActiveRecord::Migration[7.0]
#   def change
#     create_table :events do |t|
#       t.string :name, null: false
#       t.string :observations, null: true
#       t.string :infos, null: true
#       t.string :local, null: true
#       t.references :city, null: true, foreign_key: true
#       t.references :agenda_request, null: true, foreign_key: true
#       t.references :user, null: false, foreign_key: true
#       t.boolean :active, null: false, default: true
#       t.datetime :deleted_at
#       t.timestamps
#     end
#   end
# end
