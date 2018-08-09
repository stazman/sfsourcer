class CreateFpBackeds < ActiveRecord::Migration[5.2]
  def change
    create_table :fp_backeds do |t|

      t.timestamps
    end
  end
end
