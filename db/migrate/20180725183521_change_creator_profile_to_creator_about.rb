class ChangeCreatorProfileToCreatorAbout < ActiveRecord::Migration[5.2]
  def change
    rename_column :fp_creators, :creator_profile, :creator_about
  end
end
