class CreateWriterGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :writer_groups do |t|
      t.string :wg_creator
      t.string :wg_name
      t.text :wg_description

      t.timestamps
    end
  end
end
