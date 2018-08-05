class ChangeLitFanAuthorIdToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :lit_fan_works, :lit_fan_author_id, :integer
  end
end
