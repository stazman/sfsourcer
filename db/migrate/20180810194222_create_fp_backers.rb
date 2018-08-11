class CreateFpBackers < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backers do |t|
      t.string :name
      t.string :backer_email
      #t.string :reward_option
      # for later reward option
      # t.string :backer_msg
      # t.integer :user_id

      t.timestamps
    end
  end
end
