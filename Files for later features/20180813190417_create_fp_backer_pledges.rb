class CreateFpBackerPledges < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backer_pledges do |t|
      t.belongs_to :fp_backers, foreign_key: true
      t.belongs_to :pledges, foreign_key: true

      t.timestamps
    end
  end
end
