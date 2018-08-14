class RenameColumnFpBackerIdToRewardTypeinPledges < ActiveRecord::Migration[5.2]
  def change
    rename_column :pledges, :fp_backer_id, :reward_type
  end
end
