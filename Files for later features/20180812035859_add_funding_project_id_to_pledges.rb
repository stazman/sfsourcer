class AddFundingProjectIdToPledges < ActiveRecord::Migration[5.2]
  def change
    add_column :pledges, :funding_project_id, :integer
  end
end
