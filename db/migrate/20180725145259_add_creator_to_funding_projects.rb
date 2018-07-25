class AddCreatorToFundingProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_projects, :creator, :string
  end
end
