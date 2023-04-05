class AddMessageIndexBtreeToJokes < ActiveRecord::Migration[7.0]
  def change
    remove_index :jokes, :message
    add_index :jokes, :message
  end
end
