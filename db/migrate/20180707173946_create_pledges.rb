class CreatePledges < ActiveRecord::Migration[5.2]
  def change
    create_table :pledges do |t|
      t.string :amount
      t.integer :user_id
      t.integer :funding_project_id
      t.string :created_at
      t.string :updated_at
      t.timestamps
    end
  end
end
