class AddMessageIndexToJokes < ActiveRecord::Migration[7.0]
  def change
    add_index :jokes, :message, using: :hash
  end
end
