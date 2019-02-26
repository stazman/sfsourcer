class ChangeVersionToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :wg_works, :version, :string
  end
end
