class CreateLStories < ActiveRecord::Migration[5.2]
  def change
    create_table :l_stories do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
