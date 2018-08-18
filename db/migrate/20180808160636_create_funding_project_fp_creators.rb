class CreateFundingProjectFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_project_fp_creators do |t|
      t.integer :funding_project_id
      t.integer :fp_creator_id

      t.timestamps
    end
  end
end
