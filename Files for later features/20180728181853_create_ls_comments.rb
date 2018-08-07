class CreateLsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :ls_comments do |t|
      t.string :content
      t.string :user_id

      t.timestamps
    end
  end
end
