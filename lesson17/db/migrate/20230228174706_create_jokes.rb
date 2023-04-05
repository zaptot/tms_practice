class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.string :message
      t.bigint :category_id

      t.timestamps
    end
  end
end
