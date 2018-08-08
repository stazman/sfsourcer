class CreateFundingProjectsFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_projects_fp_creators do |t|
      t.integer :funding_project_id
      t.integer :fp_creator_id
    end
  end
end
