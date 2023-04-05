class AddUserIdIndexHashToJokes < ActiveRecord::Migration[7.0]
  def change
    add_index :jokes, :category_id
  end
end
