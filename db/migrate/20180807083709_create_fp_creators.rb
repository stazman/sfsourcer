class CreateFpCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_creators do |t|

      t.timestamps
    end
  end
end
