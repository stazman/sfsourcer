class DropWgWorks < ActiveRecord::Migration[5.2]
  def change
    drop_table :wg_works
  end
end
