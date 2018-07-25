class CreateFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_creators do |t|
      t.string :name
      t.string :location
      t.string :name_of_verified
      t.boolean :verified?
      t.text :creator_profile
      t.datetime :last_logged_in
      t.integer :fp_amt_created
      t.integer :fp_amt_backed
      t.string :creator_site
      t.string :instagram_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :blog_url
      t.integer :user_id

      t.timestamps
    end
  end
end