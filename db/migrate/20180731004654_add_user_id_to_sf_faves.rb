class AddUserIdToSfFaves < ActiveRecord::Migration[5.2]
  def change
    add_column :sf_faves, :user_id, :integer
  end
end
