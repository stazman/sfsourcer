class CreateFundingProjectPledges < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_project_pledges do |t|
      t.integer :funding_project_id
      t.integer :pledge_id

      t.timestamps
    end
  end
end
