class CreateFpComments < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_comments do |t|
      t.string :title
      t.string :content
      t.belongs_to :user
      t.belongs_to :funding_project

      t.timestamps
    end
  end
end
