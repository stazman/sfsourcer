class UserSfFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sf_favs do |t|
      t.integer :user_id
      t.integer :sf_fav_id

      t.timestamps
    end
  end
end
