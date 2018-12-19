class AddColumnNameToFpBacker < ActiveRecord::Migration[5.2]
  def change
    add_column :fp_backers, :name, :string
  end
end
