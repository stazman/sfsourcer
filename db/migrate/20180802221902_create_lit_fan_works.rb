class CreateLitFanWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :lit_fan_works do |t|
      t.string :title
      t.integer :lit_fan_author_id

      t.timestamps
    end
  end
end
