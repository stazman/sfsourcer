class CreateLstoryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :lstory_comments do |t|
      t.string :content
      t.string :user_id
      t.string :l_story_id

      t.timestamps
    end
  end
end
