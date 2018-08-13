class CreateFpBackerFundingProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backer_funding_projects do |t|
      t.belongs_to :fp_backer_id, foreign_key: true
      t.belongs_to :funding_project_id, foreign_key: true

      t.timestamps
    end
  end
end
