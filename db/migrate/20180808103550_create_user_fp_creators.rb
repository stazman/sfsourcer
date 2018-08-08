class CreateUserFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fp_creators do |t|
      t.integer :user_id
      t.integer :fp_creator_id
      t.timestamps
    end
  end
end
