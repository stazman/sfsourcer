class DropFpBackerFundingProjects < ActiveRecord::Migration[5.2]
  def change
    drop_table :fp_backer_funding_projects
  end
end
