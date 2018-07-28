class AddOGenreIdToLStories < ActiveRecord::Migration[5.2]
  def change
    add_column :l_stories, :ls_genre_id, :integer
  end
end
