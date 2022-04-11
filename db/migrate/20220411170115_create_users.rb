class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false 
      t.integer :age
      t.string :firstname
      t.string :lastname 
      t.string :email, null: false 
      t.string :password_digest, null: false 
      t.string :session_token, null: false 
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
