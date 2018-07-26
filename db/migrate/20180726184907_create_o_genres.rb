class CreateOGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :o_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
