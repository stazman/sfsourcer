class CreateWgComments < ActiveRecord::Migration[5.2]
  def change
    create_table :wg_comments do |t|
      t.string :author
      t.text :content
      t.integer :wg_work_id

      t.timestamps
    end
  end
end
