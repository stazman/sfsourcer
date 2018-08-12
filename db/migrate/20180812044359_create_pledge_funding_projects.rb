class CreatePledgeFundingProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :pledge_funding_projects do |t|
      t.integer :funding_project_id
      t.integer :pledge_id

      t.timestamps
    end
  end
end
