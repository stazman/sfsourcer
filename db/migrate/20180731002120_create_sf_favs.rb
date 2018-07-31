class CreateSfFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :sf_favs do |t|
      t.string :fav_lits
      t.string :fav_films
      t.string :fav_games
      t.integer :user_id
      t.string :sf_fav_type

      t.timestamps
    end
  end
end
