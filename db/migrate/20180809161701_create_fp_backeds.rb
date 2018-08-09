class CreateFpBackeds < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backeds do |t|
      t.integer :funding_project_id
      t.timestamps
    end
  end
end
