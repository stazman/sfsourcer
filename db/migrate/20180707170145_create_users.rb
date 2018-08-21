class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fav_lits
      t.string :fav_films
      t.string :fav_games
      t.string :password
      t.string :password_digest
      t.string :created_at
      t.string :updated_at
      t.timestamps
    end
  end
end
