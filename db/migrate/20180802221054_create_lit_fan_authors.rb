class CreateLitFanAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :lit_fan_authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
