class CreateFpBackerPledges < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backer_pledges do |t|
      t.integer :fp_backer_id
      t.integer :pledge_id

      t.timestamps
    end
  end
end
