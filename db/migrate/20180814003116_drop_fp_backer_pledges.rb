class DropFpBackerPledges < ActiveRecord::Migration[5.2]
  def change
    drop_table :fp_backer_pledges
  end
end
