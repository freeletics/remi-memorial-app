class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :external_id, null: false
      t.references :message, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
