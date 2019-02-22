class CreateWriterGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :writer_groups do |t|

      t.timestamps
    end
  end
end
