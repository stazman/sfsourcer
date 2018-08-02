class CreateLitFanWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :lit_fan_works do |t|
      t.string :title
      t.string :lit_fan_author_id
      t.string :name

      t.timestamps
    end
  end
end
