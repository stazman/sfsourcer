class CreatePledges < ActiveRecord::Migration[5.2]
  def change
    create_table :pledges do |t|
      t.string :amount
      t.string :created_at
      t.string :updated_at
      t.timestamps
    end
  end
end
