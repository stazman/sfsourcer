class CreateWgWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :wg_works do |t|
      t.string :author
      t.text :bio
      t.string :title
      t.string :version
      t.text :content
      t.integer :writer_group_id

      t.timestamps
    end
  end
end
