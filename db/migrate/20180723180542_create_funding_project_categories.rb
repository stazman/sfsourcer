class CreateFundingProjectCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_project_categories do |t|
      t.integer :funding_project_id
      t.integer :category_id

      t.timestamps
    end
  end
end
