class AddColumnsToFundingProjectsAndPledges < ActiveRecord::Migration[5.2]
  def change
    add_column :pledges, :fp_backer_id, :integer
    add_column :funding_projects, :fp_backer_id, :integer
  end
end
