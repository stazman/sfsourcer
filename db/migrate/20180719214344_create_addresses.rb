class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    t.belongs_to :user, index: true
    t.string :address1
    t.string :address2
    t.string :city
    t.string :state
    t.integer :zip
    t.timestamps
    end
    
  end
end
