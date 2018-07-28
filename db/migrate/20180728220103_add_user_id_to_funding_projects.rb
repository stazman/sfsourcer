class AddUserIdToFundingProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_projects, :user_id, :integer
  end
end
