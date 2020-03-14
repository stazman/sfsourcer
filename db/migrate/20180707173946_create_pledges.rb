class CreatePledges < ActiveRecord::Migration[5.2]
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.integer :fp_backer_id
      t.integer :funding_project_id
      t.string :created_at
      t.string :updated_at
      
      t.timestamps
    end
  end
end
