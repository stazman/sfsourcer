class AddColumnToWgWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :wg_works, :writer_group_id, :integer
  end
end
