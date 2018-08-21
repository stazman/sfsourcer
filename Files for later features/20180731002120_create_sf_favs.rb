class CreateSfFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :sf_favs do |t|
      t.string :fav_lits
      t.string :fav_films
      t.string :fav_games

      t.timestamps
    end
  end
end
