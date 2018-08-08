class CreateFundingProjectFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_project_fp_creators do |t|
      t.belongs_to :funding_project, foreign_key: true
      t.belongs_to :fp_creator, foreign_key: true

      t.timestamps
    end
  end
end
