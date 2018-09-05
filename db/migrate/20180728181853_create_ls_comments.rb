class CreateLsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :ls_comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :l_story_id

      t.timestamps
    end
  end
end
