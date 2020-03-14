class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text "title"
      t.text "description"
      t.text "location"
      t.text "date"
      t.text "start_time"
      t.text "cost"
      t.text "contact_info"
      
      t.timestamps
    end
  end
end
