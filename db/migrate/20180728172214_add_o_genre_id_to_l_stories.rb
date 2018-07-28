class AddOGenreIdToLStories < ActiveRecord::Migration[5.2]
  def change
    add_column :l_stories, :o_genre_id, :integer
  end
end
