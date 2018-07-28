class CreateOGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :o_genres do |t|
      t.string :name
      t.integer :user_id
      t.integer :l_story_id

      t.timestamps
    end
  end
end
