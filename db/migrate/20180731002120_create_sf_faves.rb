class CreateSfFaves < ActiveRecord::Migration[5.2]
  def change
    create_table :sf_faves do |t|
      t.string :fav_lit
      t.string :fav_film
      t.string :fav_game

      t.timestamps
    end
  end
end
