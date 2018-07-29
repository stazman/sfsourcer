class CreateFavLits < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_lits do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
