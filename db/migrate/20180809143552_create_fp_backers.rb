class CreateFpBackers < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backers do |t|

      t.timestamps
    end
  end
end
