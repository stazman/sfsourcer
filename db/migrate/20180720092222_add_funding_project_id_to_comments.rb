class AddFundingProjectIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :funding_project_id, :integer
  end
end
