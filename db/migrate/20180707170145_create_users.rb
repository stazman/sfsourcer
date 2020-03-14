class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fav_lits
      t.string :fav_films
      t.string :fav_games
      t.string :profile_image
      t.string :password
      t.string :password_digest
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
