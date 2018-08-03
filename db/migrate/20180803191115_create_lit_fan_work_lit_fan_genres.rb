class CreateLitFanWorkLitFanGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :lit_fan_work_lit_fan_genres do |t|
      t.belongs_to :lit_fan_genre, foreign_key: true
      t.belongs_to :lit_fan_work, foreign_key: true

      t.timestamps
    end
  end
end
