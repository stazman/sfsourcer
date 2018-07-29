class CreateFavGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
