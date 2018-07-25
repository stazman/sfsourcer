class AddFpCreatorIdToFundingProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_projects, :fp_creator_id, :integer
  end
end
