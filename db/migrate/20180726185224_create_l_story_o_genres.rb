class CreateLStoryOGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :l_story_o_genres do |t|
      t.integer :l_story_id
      t.integer :ls_genre_id

      t.timestamps
    end
  end
end
