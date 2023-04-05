class AddUserIdToJokes < ActiveRecord::Migration[7.0]
  def change
    add_column :jokes, :user_id, :bigint, index: true
    add_reference :jokes, :users, type: :bigint, foreign_key: true
  end
end
