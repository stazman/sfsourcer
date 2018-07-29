class CreateFavLits < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_lits do |t|
      t.string :title

      t.timestamps
    end
  end
end
