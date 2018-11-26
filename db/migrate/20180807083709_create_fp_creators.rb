class CreateFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_creators do |t|
      t.string :creator_name
      t.string :location
      t.text :creator_about
      t.string :creator_site
      t.string :email
      t.string :instagram_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :blog_url

      t.timestamps
    end
  end
end
