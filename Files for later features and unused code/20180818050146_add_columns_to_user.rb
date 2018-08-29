class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_lits, :string
    add_column :users, :fav_films, :string
    add_column :users, :fav_games, :string
  end
end
