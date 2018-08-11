class CreatesActsAsUserToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |t|
      t.string :userable_type
      t.integer :userable_id

              t.string :name
              t.string :email
              t.string :password
              t.string :password_digest
      
      t.timestamps
    end
    add_index :users, [:userable_id, :userable_type]
  end
end
