class CreateLsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ls_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
