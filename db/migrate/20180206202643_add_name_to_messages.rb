class AddNameToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :name, :string, null: false
  end
end
