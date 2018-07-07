class CreateFundingProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_projects do |t|
      t.string :title
      t.string :description
      t.string :funding_goal
      t.string :created_at
      t.string :updated_at
      t.timestamps
    end
  end
end
