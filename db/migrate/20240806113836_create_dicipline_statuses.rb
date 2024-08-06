class CreateDiciplineStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :dicipline_statuses do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
