class AddUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :user, foreign_key: true, index: true, null: false
  end
end
